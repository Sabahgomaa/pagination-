import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pagination/screens/bloc/states.dart';
import 'package:pagination/screens/model.dart';

import '../../shared/server_gate.dart';
import 'event.dart';

class SearchBloc extends Bloc<SearchEvents, SearchStates> {
  final serverGate = ServerGate();
  SearchModel? model;
  List<Products> data = [];
  List<Products> newData = [];
  String searchController = '';
  final formKey = GlobalKey<FormState>();

  String next = 'https://davinanewstore.davinastore.com/app/products/search';

  SearchBloc() : super(SearchStates()) {
    on<GetSearchEvent>(_getSearch);
    on<StartPaginationEvent>(_pagination);
  }

  Future _getUrl(String url) async {
    final response = await serverGate.getFromServer(url: url, params: {
      'name': searchController.trim(),
    });
    return response;
  }

  Future<void> _getSearch(
      GetSearchEvent event, Emitter<SearchStates> emit) async {
    emit(SearchLoadingState());
    final res = await _getUrl(next);
    if (res.success) {
      model = SearchModel.fromJson(res.response!.data);
      newData = model!.data;
      data.addAll(newData);
      emit(SearchSuccessState());
    } else {
      emit(SearchFailedState(res.msg));
    }
  }

  FutureOr<void> _pagination(
      StartPaginationEvent event, Emitter<SearchStates> emit) async {
    emit(SearchLoadingState());
    if (model!.links.next.isNotEmpty) {
      next = model!.links.next;
      _getUrl(
        next,
      );
      add(GetSearchEvent());
    }
    emit(SearchSuccessState());
  }
}

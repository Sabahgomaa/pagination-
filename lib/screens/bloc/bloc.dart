import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pagination/screens/bloc/states.dart';
import 'package:pagination/screens/model.dart';

import '../../shared/server_gate.dart';
import 'event.dart';

class SearchBloc extends Bloc<SearchEvents, SearchStates> {
  final serverGate = ServerGate();
  SearchModel? model;
  String searchController = '';
  final formKey = GlobalKey<FormState>();
  int page = 1;

  SearchBloc() : super(SearchStates()) {
    on<GetSearchEvent>(_getSearch);
    on<StartPaginationEvent>(_pagination);
  }

  Future<void> _getSearch(
      GetSearchEvent event, Emitter<SearchStates> emit) async {
    emit(SearchLoadingState());
    final res = await serverGate.getFromServer(
        url:
            "https://davinanewstore.davinastore.com/app/products/search?name=${searchController.trim()}&page=$page",
        params: {
          'keyword': searchController.trim(),
        });
    if (res.success) {
      model = SearchModel.fromJson(res.response!.data);
      if (kDebugMode) {
        print(page);
      }
      emit(SearchSuccessState());
    } else {
      emit(SearchFailedState(res.msg));
    }
  }

  FutureOr<void> _pagination(
      StartPaginationEvent event, Emitter<SearchStates> emit) async {
    emit(SearchLoadingState());
    await Future.delayed(const Duration(seconds: 3)); // streaming get next page
    if (model!.links.next.isNotEmpty) {
      page++;
      add(GetSearchEvent());
    }
    emit(SearchSuccessState());
  }
}

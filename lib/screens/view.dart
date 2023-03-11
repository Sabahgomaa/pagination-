import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:pagination/screens/components/item_product.dart';
import 'package:pagination/shared/colors.dart';
 import 'bloc/bloc.dart';
import 'bloc/event.dart';
import 'bloc/states.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<SearchBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: bloc,
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
              appBar: AppBar(
                title: const Text('pagination'),
                centerTitle: true,
              ),
              body: BlocBuilder(
                  bloc: bloc,
                  builder: (context, state) {
                    return Form(
                      key: bloc.formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            autofocus: false,
                            cursorColor: AppColors.green,
                            onChanged: (data) {},
                            onFieldSubmitted: (data) {
                              bloc.searchController = data;
                              bloc.add(GetSearchEvent());
                              if (kDebugMode) {
                                print(bloc.searchController);
                              }
                            },
                            //  controller: bloc.searchController,
                            decoration: InputDecoration(
                              hintText: 'search',
                              filled: true,
                              fillColor: AppColors.greyLite.withOpacity(.1),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              hintStyle: TextStyle(
                                  color: const Color(0xffAFAFAF),
                                  fontSize: 15.sp),
                              prefixIcon: Container(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 18, end: 11, top: 10, bottom: 10),
                                child: SvgPicture.asset(
                                  "assets/images/svg_images/search.svg",
                                  height: 15.h,
                                  width: 15.w,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: BlocBuilder(
                                bloc: bloc,
                                builder: (context, state) {
                                   if (bloc.model == null) {
                                    return const SizedBox();
                                  } else {
                                    return bloc.model!.data.isEmpty
                                        ? const Text("Not Found Result")
                                        : NotificationListener<
                                            ScrollNotification>(
                                            onNotification:
                                                (ScrollNotification sn) {
                                              if (state is SearchSuccessState &&
                                                  sn
                                                      is ScrollUpdateNotification &&
                                                  sn.metrics.pixels ==
                                                      sn.metrics
                                                          .maxScrollExtent &&
                                                  sn.metrics.axisDirection ==
                                                      AxisDirection.down) {
                                                bloc.add(
                                                    StartPaginationEvent());
                                              }
                                              return true;
                                            },
                                            child: GridView.builder(
                                              // physics: const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount:
                                                  bloc.model!.data.length,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 1.0,
                                                childAspectRatio: 163 / 200,
                                                mainAxisSpacing: 1.0,
                                              ),
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                    child: ItemProduct(
                                                  name:
                                                      bloc.newData[index].name,
                                                  desc:
                                                      bloc.newData[index].desc,
                                                  image: bloc
                                                      .newData[index]
                                                      .productDetails[0]
                                                      .images[0]
                                                      .url,
                                                ));
                                              },
                                            ),
                                          );
                                  }
                                }),
                          ),
                        ],
                      ),
                    );
                  }),

              bottomNavigationBar: state is SearchLoadingState
                  ? Container(
                      margin: EdgeInsets.only(top: 20.h),
                      child: const LinearProgressIndicator(minHeight: 10,
                        // strokeWidth: 4.0,
                        backgroundColor: Colors.grey,
                        // valueColor: AlwaysStoppedAnimation(Colors.white),
                        color: Colors.blue,
                      ))
                  : const SizedBox(),
            ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingProgress extends StatelessWidget {
  final bool withNoMargin;
  const LoadingProgress({Key? key, this.withNoMargin = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin:withNoMargin?null: EdgeInsets.only(top: 20.h),
          child: const CircularProgressIndicator(
            strokeWidth: 4.0,
            backgroundColor: Colors.grey,
            // valueColor: AlwaysStoppedAnimation(Colors.white),
            color: Colors.blue,
          )),
    );
  }
}
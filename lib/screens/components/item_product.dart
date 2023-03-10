import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pagination/shared/colors.dart';

class ItemProduct extends StatelessWidget {
  final String name, desc, image;

  const ItemProduct({
    Key? key,
    required this.name,
    required this.desc,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(image,width: 100.w,height: 100.h),
          Text(
            name,
            style: TextStyle(
              color: AppColors.green,
              fontWeight: FontWeight.bold,
              fontSize: 22.sp,
            ),
          ),
          Text(
            desc,
            style: TextStyle(
                color: AppColors.grey,
                fontSize: 14.sp,
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}

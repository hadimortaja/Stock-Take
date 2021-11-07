import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final double? cHeight;
  final double? cWidth;
  final Color? color;
  final Function()? onTap;
  CustomButton({this.title, this.cHeight, this.cWidth, this.color, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: cWidth ?? 80.w,
          height: cHeight ?? 30.h,
          decoration: BoxDecoration(
              color: color ?? Colors.blue,
              borderRadius: BorderRadius.circular(5.r)),
          child: Center(
            child:
                CustomText(title ?? "", fontSize: 14.sp, color: Colors.white),
          ),
        ));
  }
}

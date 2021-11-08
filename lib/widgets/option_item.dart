import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocktake/widgets/custom_text.dart';

class OptionItem extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  final bool value;
  OptionItem({this.title, this.onTap, this.value = false});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: onTap,
              child: Container(
                height: 20.h,
                width: 20.w,
                decoration: BoxDecoration(
                    color: value ? Colors.blue : Colors.transparent,
                    borderRadius: BorderRadius.circular(5.r),
                    border: value
                        ? Border.all(color: Colors.blue)
                        : Border.all(color: Colors.white)),
                child: value
                    ? Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15.h,
                        ),
                      )
                    : SizedBox(),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            CustomText(
              title,
              fontSize: 14.sp,
              color: Colors.white,
            )
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}

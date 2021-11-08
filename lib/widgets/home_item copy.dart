import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocktake/value/colors.dart';
import 'package:stocktake/widgets/custom_text.dart';

class HomeItem1 extends StatelessWidget {
  final String? title;
  final String? hint;
  final double? sized;
  final double? cHeight;
  final Widget? child;
  final bool? hasFocus;
  final String? initialVal;
  final FontWeight? fontWeight;
  HomeItem1(
      {this.title,
      this.hint,
      this.cHeight,
      this.sized,
      this.child,
      this.fontWeight,
      this.hasFocus,
      this.initialVal});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: 120.w,
              ),
              child: CustomText(
                title ?? "",
                fontSize: 13.sp,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: sized ?? 0.w,
            ),
            Expanded(
              child: Container(
                width: Get.width,
                height: cHeight ?? 30.h,
                color: AppColors.secondaryColor,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0.w, top: 10.h),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    initialValue: initialVal ?? "",
                    decoration: InputDecoration(
                      hintText: hint ?? "",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.sp,
                          fontWeight: fontWeight ?? FontWeight.w700),
                    ),
                    enableInteractiveSelection: hasFocus == true
                        ? true
                        : false, // will disable paste operation
                    focusNode: hasFocus == true
                        ? AlwaysEnabledFocusNode()
                        : AlwaysDisabledFocusNode(),
                  ),
                ),
              ),
            ),
            child != null
                ? SizedBox(
                    width: 5.w,
                  )
                : SizedBox(
                    height: 0.0,
                    width: 0.0,
                  ),
            child ??
                SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class AlwaysEnabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => true;
}

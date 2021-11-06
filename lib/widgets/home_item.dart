import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocktake/value/colors.dart';
import 'package:stocktake/widgets/custom_text.dart';
class HomeItem extends StatelessWidget {
final String? title;
final String? hint;
 final double? sized;
 final double? cHeight;
 final Widget? child;
HomeItem({this.title,this.hint,this.cHeight,this.sized,this.child});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
            Container(
              constraints: BoxConstraints(maxWidth: 62.w),
              child: CustomText(title,
              fontSize: 14.sp,
color: Colors.white,
              ),
            ),
          SizedBox(width: sized??18.w,),
          Expanded(
            child: Container(width: Get.width,
            height: cHeight??30.h,
              color: AppColors.secondaryColor,
              child: Padding(
                padding:  EdgeInsets.only(left:8.0.w,top: 5.h),
                child: TextField(
                  decoration: InputDecoration(hintText: hint??"",
                  hintStyle: TextStyle(color: Colors.grey,
                  fontSize: 14.sp,
                  ),
                  ),
                    enableInteractiveSelection: false, // will disable paste operation
                    focusNode: new AlwaysDisabledFocusNode(),

                ),
              ),
            ),
          ),
          child!=null?SizedBox(width: 5.w,):SizedBox(height: 0.0,width: 0.0,),
          child??SizedBox(height: 0.0,width: 0.0,),


        ],),
        SizedBox(height: 15.h,),
      ],
    );
  }
}
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
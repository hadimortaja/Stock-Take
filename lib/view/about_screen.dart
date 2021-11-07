import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocktake/widgets/custom_button.dart';
import 'package:stocktake/widgets/custom_text.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 35.h,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 35.h,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                "ACCOUNT",
                fontSize: 50.sp,
                color: Colors.blue,
              ),
              CustomText(
                "SOFT",
                fontSize: 50.sp,
                color: Colors.orangeAccent,
              ),
            ],
          ),
          CustomText(
            "ENTERPRISE SDN BHD",
            fontSize: 25.sp,
            color: Colors.grey,
          ),
          SizedBox(
            height: 35.h,
          ),
          CustomText(
            "Product ID: ef70398602a07eb2",
            fontSize: 18.sp,
            color: Colors.white,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomButton(
            onTap: () {},
            cWidth: 180.w,
            cHeight: 50.h,
            title: "ACTIVATE NOW",
          ),
          SizedBox(
            height: 200.h,
          ),
          CustomText(
            "Version 7.6 Rev 14",
            fontSize: 14.sp,
            color: Colors.white,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomText(
            "181,1ST FLOOR,HUI SING COMMERCIAL CENTRE,93350",
            fontSize: 14.sp,
            color: Colors.white,
          ),
          CustomText(
            "KUCHING,SARAWAK.",
            fontSize: 14.sp,
            color: Colors.white,
          ),
          CustomText(
            "Tel:082-462 181 Fax: 082-463 181",
            fontSize: 14.sp,
            color: Colors.white,
          ),
        ],
      ),
    ));
  }
}

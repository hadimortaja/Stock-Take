import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocktake/value/app_get.dart';
import 'package:stocktake/value/colors.dart';
import 'package:stocktake/widgets/custom_button.dart';
import 'package:stocktake/widgets/custom_text.dart';
import 'package:stocktake/widgets/home_item.dart';

class HomePage extends StatelessWidget {
  AppGet appGet =Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: CustomText("StockTake", color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 30.h,
            ),
          )
        ],
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.h),
                child: Column(
                  children: [
                    HomeItem(
                      title: "Indicator",
                    ),
                    HomeItem(
                      title: "Document Type",
                      hint: "Document Type",
                      sized: 10.w,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: Colors.white,
                          thickness: 1.5.h,
                        )),
                        CustomText(
                          "  Item Info  ",
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                        Expanded(
                            child: Divider(
                          color: Colors.white,
                          thickness: 1.5.h,
                        )),
                        SizedBox(
                          width: 10.w,
                        ),
                        CustomButton(
                          onTap: () {},
                          title: "Start",
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    HomeItem(
                        title: "BarCode",
                        sized: 10.w,
                        child: CustomButton(
                          onTap: () {},
                          title: "Scan",
                          color: Colors.grey,
                        )),
                    HomeItem(
                      title: "Quantity",
                      sized: 10.w,
                    ),
                   GetBuilder<AppGet>(
                       init: AppGet(),
                       id: "check",
                       builder: (controller){
                     return  HomeItem(
                       title: "ItemCode",
                       sized: 5.w,
                       child: Row(
                         children: [
                           GestureDetector(
                             onTap:(){
                               controller.setIsChecked();
                               print(controller.isChecked);
                             },
                             child: Container(
                                 height: 20.h,
                                 width: 20.w,
                                 decoration: BoxDecoration(
                                     color: controller.isChecked? Colors.blue:Colors.transparent,
                                     borderRadius: BorderRadius.circular(5.r),
                                     border:controller.isChecked? Border.all(color: Colors.blue):Border.all(color: Colors.white)),
                             child: controller.isChecked?Center(child: Icon(Icons.check,
                             color: Colors.white,
                               size: 15.h,
                             ),):SizedBox(),
                             ),
                           ),
                           SizedBox(
                             width: 10.h,
                           ),
                           Padding(
                             padding: EdgeInsets.only(top: 8.0.h),
                             child: CustomText("IsActive",
                                 fontSize: 14.sp, color: Colors.white),
                           )
                         ],
                       ),
                     );

                   }),
                    SizedBox(
                      height: 200.h,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 3.h,
              child: Container(
                height: 200.h,
                width: Get.width,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    border: Border.all(color: Colors.white, width: 3.w)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

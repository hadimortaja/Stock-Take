import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocktake/value/colors.dart';
import 'package:stocktake/view/sql_server_setting_screen.dart';
import 'package:stocktake/widgets/custom_button.dart';
import 'package:stocktake/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocktake/widgets/home_item.dart';

class QrCodeServerSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText("QR Code Server Setting", color: Colors.white),
        actions: [
          PopupMenuButton<int>(
            // color: Colors.black,
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                  value: 0,
                  child: CustomText(
                    "Use QR Synchronize",
                    fontSize: 14.sp,
                  )),
            ],
            onSelected: (item) => SelectedItem(context, item),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
          child: Column(
            children: [
              HomeItem(
                hint: " Company Name",
                cHeight: 50.h,
                fontWeight: FontWeight.bold,
              ),
              HomeItem(
                hint: " Company Address 1",
                cHeight: 50.h,
                fontWeight: FontWeight.bold,
              ),
              HomeItem(
                hint: " Company Address 2",
                cHeight: 50.h,
                fontWeight: FontWeight.bold,
              ),
              HomeItem(
                hint: " Company Address 3",
                cHeight: 50.h,
                fontWeight: FontWeight.bold,
              ),
              HomeItem(
                hint: " Company Address 4",
                cHeight: 50.h,
                fontWeight: FontWeight.bold,
              ),
              HomeItem(
                hint: "Database Name",
                cHeight: 50.h,
                fontWeight: FontWeight.bold,
              ),
              CustomButton(
                cWidth: Get.width,
                cHeight: 50.h,
                title: "SCAN QR CODE",
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      cWidth: Get.width,
                      cHeight: 50.h,
                      title: "DOWNLOAD ITEM",
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: CustomButton(
                      cWidth: Get.width,
                      cHeight: 50.h,
                      title: "UPLOAD RESULT",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomButton(
                cWidth: Get.width,
                cHeight: 50.h,
                title: "SAVE AND CLOSE",
              ),
            ],
          ),
        ),
      ),
    );
  }

  void SelectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        Get.off(() => SqlServerSettingScreen());
        break;
    }
  }
}

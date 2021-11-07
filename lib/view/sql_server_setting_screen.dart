import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocktake/view/qr_code_server_settings_screen.dart';
import 'package:stocktake/widgets/custom_button.dart';
import 'package:stocktake/widgets/custom_text.dart';
import 'package:stocktake/widgets/home_item.dart';

class SqlServerSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText("SQL Server Setting", color: Colors.white),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeItem(
                hint: "Server",
                cHeight: 50.h,
                fontWeight: FontWeight.bold,
                hasFocus: true,
              ),
              HomeItem(
                hint: "Database",
                cHeight: 50.h,
                fontWeight: FontWeight.bold,
                hasFocus: true,
              ),
              HomeItem(
                hint: "Username",
                cHeight: 50.h,
                fontWeight: FontWeight.bold,
                hasFocus: true,
              ),
              HomeItem(
                hint: "Password",
                cHeight: 50.h,
                fontWeight: FontWeight.bold,
                hasFocus: true,
              ),
              CustomText(
                "Load Default",
                color: Colors.blue,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomButton(
                onTap: () {},
                cWidth: Get.width,
                cHeight: 50.h,
                title: "TEST CONNECTION",
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onTap: () {},
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
                      onTap: () {},
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
                onTap: () {},
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
        Get.off(() => QrCodeServerSetting());
        break;
    }
  }
}

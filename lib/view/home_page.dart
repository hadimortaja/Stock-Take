import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:search_choices/search_choices.dart';
import 'package:stocktake/value/app_get.dart';
import 'package:stocktake/value/colors.dart';
import 'package:stocktake/value/constant.dart';
import 'package:stocktake/view/about_screen.dart';
import 'package:stocktake/view/option_screen.dart';
import 'package:stocktake/view/qr_code_server_settings_screen.dart';
import 'package:stocktake/widgets/custom_button.dart';
import 'package:stocktake/widgets/custom_text.dart';
import 'package:stocktake/widgets/home_item.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _scanBarcode = '';

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  AppGet appGet = Get.find();
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: CustomText("StockTake", color: Colors.white),
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.more_vert,
          //     color: Colors.white,
          //     size: 30.h,
          //   ),
          // )
          PopupMenuButton<int>(
            // color: Colors.black,
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                  value: 0,
                  child: CustomText(
                    "Synchronize",
                    fontSize: 14.sp,
                  )),
              PopupMenuItem<int>(
                  value: 1,
                  child: CustomText(
                    "Option",
                    fontSize: 14.sp,
                  )),
              PopupMenuItem<int>(
                  value: 2,
                  child: CustomText(
                    "About",
                    fontSize: 14.sp,
                  )),
              PopupMenuItem<int>(
                  value: 3,
                  child: GetBuilder<AppGet>(
                    init: AppGet(),
                    id: "check1",
                    builder: (controller1) {
                      return Row(
                        children: [
                          CustomText(
                            "Demo",
                            fontSize: 14.sp,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.h),
                            child: GestureDetector(
                              onTap: () {
                                controller1.setIsChecked1();
                                print(controller1.isChecked1);
                              },
                              child: Container(
                                height: 20.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                    color: controller1.isChecked1
                                        ? Colors.blue
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5.r),
                                    border: controller1.isChecked1
                                        ? Border.all(color: Colors.blue)
                                        : Border.all(color: Colors.grey)),
                                child: controller1.isChecked1
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
                          ),
                        ],
                      );
                    },
                  )),
              PopupMenuItem<int>(
                  value: 4,
                  child: CustomText(
                    "Exit",
                    fontSize: 14.sp,
                  )),
            ],
            onSelected: (item) => SelectedItem(context, item),
          ),
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
                    GestureDetector(
                      onTap: () {
                        showDialog<void>(
                          barrierDismissible: true,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                'Shelf',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Flexible(
                                          flex: 2,
                                          child: TextFormField(
                                            controller: _textEditingController,
                                            decoration: InputDecoration(
                                                hintText: "Select Shelf"),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: CustomButton(
                                            onTap: () {
                                              scanBarcodeNormal();
                                            },
                                            cWidth: 80.w,
                                            cHeight: 30.h,
                                            title: "Scan",
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Row(
                        children: [
                          CustomText(
                            "Shelf",
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                          SizedBox(
                            width: 40.w,
                          ),
                          Container(
                            width: 303.w,
                            height: 30.h,
                            decoration:
                                BoxDecoration(color: AppColors.secondaryColor),
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.0.w, top: 10.h),
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),

                                decoration: InputDecoration(
                                  // hintText: hint ?? "",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                                enableInteractiveSelection:
                                    false, // will disable paste operation
                                focusNode: AlwaysDisabledFocusNode(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    // HomeItem(
                    //   title: "Shelf",
                    //   sized: 40.w,
                    //   onTap: () {
                    //     print("dddd");
                    //     showDialog<void>(
                    //       barrierDismissible: true,
                    //       context: context,
                    //       builder: (BuildContext context) {
                    //         return AlertDialog(
                    //           title: const Text(
                    //             'Password',
                    //             style: TextStyle(fontWeight: FontWeight.bold),
                    //           ),
                    //           content: SingleChildScrollView(
                    //             child: ListBody(
                    //               children: <Widget>[
                    //                 TextFormField(
                    //                   controller: _textEditingController,
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //           actions: <Widget>[
                    //             TextButton(
                    //               child: const Text(
                    //                 'No',
                    //                 style:
                    //                     TextStyle(fontWeight: FontWeight.bold),
                    //               ),
                    //               onPressed: () {
                    //                 Navigator.of(context).pop();
                    //               },
                    //             ),
                    //             TextButton(
                    //               child: const Text(
                    //                 'yes',
                    //                 style:
                    //                     TextStyle(fontWeight: FontWeight.bold),
                    //               ),
                    //               onPressed: () {
                    //                 if (_textEditingController.text
                    //                         .toString() ==
                    //                     "123456") {
                    //                   Get.back();
                    //                   Get.to(() => OptionScreen());

                    //                   _textEditingController.clear();
                    //                 } else {
                    //                   _textEditingController.clear();

                    //                   setToast("Wrong Password");
                    //                 }
                    //               },
                    //             ),
                    //           ],
                    //         );
                    //       },
                    //     );
                    //   },
                    // ),

                    HomeItem(
                      title: "Indicator",
                      sized: 20.w,
                    ),
                    HomeItem(
                      title: "Document Type",
                      hint: "Document Type",
                      sized: 5.w,
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
                        hint: _scanBarcode,
                        title: "BarCode",
                        sized: 10.w,
                        child: CustomButton(
                          onTap: () {
                            scanBarcodeNormal();
                          },
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
                        builder: (controller) {
                          return HomeItem(
                            title: "ItemCode",
                            sized: 5.w,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.setIsChecked();
                                    print(controller.isChecked);
                                  },
                                  child: Container(
                                    height: 20.h,
                                    width: 20.w,
                                    decoration: BoxDecoration(
                                        color: controller.isChecked
                                            ? Colors.blue
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        border: controller.isChecked
                                            ? Border.all(color: Colors.blue)
                                            : Border.all(color: Colors.white)),
                                    child: controller.isChecked
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
                                  width: 10.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0.h),
                                  child: CustomText("IsActive",
                                      fontSize: 14.sp, color: Colors.white),
                                ),
                              ],
                            ),
                          );
                        }),
                    HomeItem(
                      title: "Batch No.",
                      sized: 5.w,
                    ),
                    Row(
                      children: [
                        Container(
                          constraints: BoxConstraints(maxWidth: 62.w),
                          child: CustomText(
                            "UOM",
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        Expanded(
                          child: Container(
                            width: Get.width,
                            height: 30.h,
                            color: AppColors.secondaryColor,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.0.w, top: 5.h),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                enableInteractiveSelection:
                                    false, // will disable paste operation
                                focusNode: new AlwaysDisabledFocusNode(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: 62.w),
                          child: CustomText(
                            "UOM Date",
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Container(
                            width: Get.width,
                            height: 30.h,
                            color: AppColors.secondaryColor,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.0.w, top: 5.h),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                enableInteractiveSelection:
                                    false, // will disable paste operation
                                focusNode: new AlwaysDisabledFocusNode(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Container(
                          constraints: BoxConstraints(maxWidth: 62.w),
                          child: CustomText(
                            "Price 1",
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 22.w,
                        ),
                        Expanded(
                          child: Container(
                            width: Get.width,
                            height: 30.h,
                            color: AppColors.secondaryColor,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.0.w, top: 5.h),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                enableInteractiveSelection:
                                    false, // will disable paste operation
                                focusNode: new AlwaysDisabledFocusNode(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: 62.w),
                          child: CustomText(
                            "Price 2",
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Container(
                            width: Get.width,
                            height: 30.h,
                            color: AppColors.secondaryColor,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.0.w, top: 5.h),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                enableInteractiveSelection:
                                    false, // will disable paste operation
                                focusNode: new AlwaysDisabledFocusNode(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    HomeItem(
                      title: "Description",
                      sized: 20.w,
                    ),
                    HomeItem(
                      title: "Description2",
                      sized: 20.w,
                    ),
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

  void SelectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        Get.to(() => QrCodeServerSetting());
        break;
      case 1:
        showDialog<void>(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    TextFormField(
                      controller: _textEditingController,
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    'No',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text(
                    'yes',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (_textEditingController.text.toString() == "123456") {
                      Get.back();
                      Get.to(() => OptionScreen());

                      _textEditingController.clear();
                    } else {
                      _textEditingController.clear();

                      setToast("Wrong Password");
                    }
                  },
                ),
              ],
            );
          },
        );

        break;
      case 2:
        Get.to(() => AboutScreen());

        break;
      case 3:
        // ignore: todo
        //TODO
        break;
      case 4:
        SystemNavigator.pop();
        break;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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
                        // print('')
                        // Container(
                        //     width: double.infinity,
                        //     // height: 68.h,
                        //     padding: EdgeInsets.symmetric(horizontal: 5.w),
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10.0),
                        //       color: const Color(0xffffffff),
                        //       border: Border.all(
                        //           width: 0.3, color: const Color(0xffd8d8d8)),
                        //       boxShadow: [
                        //         BoxShadow(
                        //           color: const Color(0x0f000000),
                        //           offset: Offset(0, 5),
                        //           blurRadius: 5,
                        //         ),
                        //       ],
                        //     ),
                        //     child: Center(
                        //         child: SearchChoices.multiple(
                        //       items: [].map<DropdownMenuItem<dynamic>>(
                        //         (e) {
                        //           return DropdownMenuItem(
                        //               child: CustomText(
                        //                 e['name'],
                        //                 fontSize: 16.sp,
                        //               ),
                        //               onTap: () {
                        //                 // controller
                        //                 //     .setCatregoryData(
                        //                 //         e);
                        //                 // appGetController
                        //                 //     .addIntrest(
                        //                 //         e);
                        //               },
                        //               value: e['name']);
                        //         },
                        //       ).toList(),
                        //       // selectedItems: controller
                        //       //     .selectedItemsMultiCustomDisplayDialog,
                        //       hint: Padding(
                        //         padding: const EdgeInsets.all(12.0),
                        //         child: CustomText(
                        //           'select_the_place',
                        //           fontSize: 16.sp,
                        //         ),
                        //       ),
                        //       searchHint: "Select The Place",
                        //       onChanged: (value) {
                        //         print("rrrrrrrrrrrrrrrrrrr $value");

                        //         // controller.setSelectedDrop(value);
                        //         value.toList().map((e) {
                        //           // print("ccccccccvvvvvvvvvvvvvvv");
                        //           // controller.setCitesListId(controller
                        //           //     .getCitesMap.value['data'][e]['id']
                        //           //     .toString());
                        //           // print(
                        //           //     "rrrrrrrrrrrrrrrrrrrrrrrr ${controller.getCitesMap.value['data'][e]['id']}");
                        //         }).toList();
                        //         // setState(() {
                        //         //   selectedItemsMultiCustomDisplayDialog =
                        //         //       value;
                        //         // });
                        //       },
                        //       displayItem: (item, selected) {
                        //         return (Row(children: [
                        //           selected
                        //               ? Icon(
                        //                   Icons.check,
                        //                   color: Colors.green,
                        //                 )
                        //               : Icon(
                        //                   Icons.check_box_outline_blank,
                        //                   color: Colors.grey,
                        //                 ),
                        //           SizedBox(width: 7),
                        //           Expanded(
                        //             child: item,
                        //           ),
                        //         ]));
                        //       },
                        //       rightToLeft: true,

                        //       selectedValueWidgetFn: (item) {
                        //         return SizedBox(
                        //           width: Get.width,
                        //           child: Row(
                        //             children: [
                        //               Card(

                        //                   // shape: RoundedRectangleBorder(
                        //                   //   borderRadius:
                        //                   //       BorderRadius.circular(10),
                        //                   //   side: BorderSide(
                        //                   //     color: Colors.brown,
                        //                   //     width: 0.5,
                        //                   //   ),
                        //                   // ),
                        //                   margin: EdgeInsets.all(12),
                        //                   child: Padding(
                        //                     padding: const EdgeInsets.all(8),
                        //                     child: CustomText(
                        //                       item.toString(),
                        //                       fontSize: 16.sp,
                        //                     ),
                        //                   )),
                        //             ],
                        //           ),
                        //         );
                        //       },
                        //       doneButton: (selectedItemsDone, doneContext) {
                        //         return (RaisedButton(
                        //             onPressed: () {
                        //               Navigator.pop(doneContext);
                        //               setState(() {});
                        //             },
                        //             child: Text("Save")));
                        //       },
                        //       closeButton: null,
                        //       style: TextStyle(fontStyle: FontStyle.italic),
                        //       searchFn: (String keyword, items) {
                        //         var ret = <int>[];
                        //         if (keyword != null &&
                        //             items != null &&
                        //             keyword.isNotEmpty) {
                        //           keyword.split(" ").forEach((k) {
                        //             int i = 0;
                        //             items.forEach((item) {
                        //               if (k.isNotEmpty &&
                        //                   (item.value
                        //                       .toString()
                        //                       .toLowerCase()
                        //                       .contains(k.toLowerCase()))) {
                        //                 ret.add(i);
                        //               }
                        //               i++;
                        //             });
                        //           });
                        //         }
                        //         if (keyword.isEmpty) {
                        //           ret = Iterable<int>.generate(items.length)
                        //               .toList();
                        //         }
                        //         return (ret);
                        //       },
                        //       clearIcon: Icon(Icons.clear_all),
                        //       icon: null,
                        //       //label: "Label for multi",
                        //       underline: Container(
                        //           // height: 1.0,
                        //           // decoration: BoxDecoration(
                        //           //     border: Border(
                        //           //         bottom: BorderSide(
                        //           //             color: Colors.teal,
                        //           //             width: 3.0))),
                        //           ),
                        //       iconDisabledColor: Colors.brown,
                        //       iconEnabledColor: Colors.indigo,
                        //       isExpanded: true,
                        //     )));
                      },
                      child: HomeItem(
                        title: "Shelf",
                        sized: 40.w,
                      ),
                    ),
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
                      height: 15.h,
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
                      height: 15.h,
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

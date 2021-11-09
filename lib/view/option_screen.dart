import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocktake/value/app_get.dart';
import 'package:stocktake/value/colors.dart';
import 'package:stocktake/widgets/custom_button.dart';
import 'package:stocktake/widgets/custom_text.dart';
import 'package:stocktake/widgets/home_item%20copy.dart';
import 'package:stocktake/widgets/home_item.dart';
import 'package:stocktake/widgets/option_item.dart';

class OptionScreen extends StatefulWidget {
  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  AppGet appGet = Get.find();

  int? groupValue;
  static const List<String> selections = <String>[
    'Just save',
    'Prompt warning',
    'Prompt warning and ask for password',
  ];
  int? groupValue2;
  static const List<String> selections2 = <String>[
    'Price1',
    'Price2',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomText(
            "Option",
            color: Colors.white,
          ),
        ),
        body: GetBuilder<AppGet>(
            init: AppGet(),
            builder: (_) {
              return SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            "Setting",
                            color: Colors.blue,
                            fontSize: 30.sp,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          HomeItem1(
                            title: "Default Quantity",
                            sized: 10.w,
                            hasFocus: true,
                          ),
                          HomeItem1(
                            title: "Max Quantity",
                            sized: 28.w,
                            hasFocus: true,
                            initialVal: "99999",
                            child: Row(
                              children: [
                                CustomText(
                                  "Decemal",
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                ),
                                IconButton(
                                    onPressed: () {
                                      _.increment();
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.blue,
                                    )),
                                Container(
                                  height: 25.h,
                                  width: 25.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.secondaryColor),
                                  child: Center(
                                    child: CustomText(
                                      _.value.toString(),
                                      fontSize: 14.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      _.dicrement();
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.red,
                                    )),
                              ],
                            ),
                          ),
                          HomeItem(
                            title: "Indicator",
                            sized: 50.w,
                          ),
                          OptionItem(
                            value: _.promptCheck,
                            onTap: () => _.setPromptCheck(),
                            title: "Prompt Indicator before start",
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 25.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OptionItem(
                                  value: _.price1,
                                  onTap: () => _.setPrice1(),
                                  title: "Price1",
                                ),
                                OptionItem(
                                  value: _.price2,
                                  onTap: () => _.setPrice2(),
                                  title: "Price2",
                                ),
                                OptionItem(
                                  value: _.cost,
                                  onTap: () => _.setCost(),
                                  title: "Cost",
                                ),
                              ],
                            ),
                          ),
                          OptionItem(
                            value: _.scan,
                            onTap: () => _.setScan(),
                            title: "Scan and Insert (Qty Always 1)",
                          ),
                          OptionItem(
                            value: _.allow,
                            onTap: () => _.setAllow(),
                            title: "Allow to Delete",
                          ),
                          OptionItem(
                            value: _.confirm,
                            onTap: () => _.setConfirm(),
                            title: "Confirm during entry",
                          ),
                          OptionItem(
                            value: _.prompt,
                            onTap: () => _.setPrompt(),
                            title: "Always prompt to choose UOM",
                          ),
                          OptionItem(
                            value: _.promptMessage,
                            onTap: () => _.setPromptMessage(),
                            title: "Prompt message for duplicate barcode",
                          ),
                          OptionItem(
                            value: _.saveInvalidCode,
                            onTap: () => _.setSaveInvalidCode(),
                            title: "Allow to save invalid barcode",
                          ),
                          SizedBox(
                            width: Get.width,
                            child: ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemBuilder: (BuildContext context, int index) {
                                return Theme(
                                  data: ThemeData.dark(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Radio<int>(
                                          // fillColor: Color(),
                                          value: index,
                                          groupValue: groupValue,
                                          toggleable: true,
                                          onChanged: (int? value) {
                                            setState(() {
                                              groupValue = value;
                                            });
                                          }),
                                      CustomText(
                                        selections[index],
                                        fontSize: 14.sp,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: selections.length,
                            ),
                          ),
                          HomeItem1(
                            title: "Password",
                            sized: 20.w,
                            initialVal: "........",
                            hasFocus: true,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          CustomText(
                            "Weight Scale",
                            color: Colors.blue,
                            fontSize: 30.sp,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          HomeItem1(
                            title: "Flag Digit",
                            sized: 20.w,
                          ),
                          Row(children: [
                            SizedBox(
                              width: 90.w,
                            ),
                            CustomText(
                              "Start",
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                            SizedBox(
                              width: 60.w,
                            ),
                            CustomText(
                              "End",
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                            SizedBox(
                              width: 40.w,
                            ),
                            CustomText(
                              "Decimal",
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ]),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              CustomText(
                                "ItemCode",
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              IconButton(
                                  padding: const EdgeInsets.all(0.0),
                                  constraints: BoxConstraints(),
                                  onPressed: () {
                                    _.increment1();
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                  )),
                              Container(
                                height: 25.h,
                                width: 25.w,
                                decoration: BoxDecoration(
                                    color: AppColors.secondaryColor),
                                child: Center(
                                  child: CustomText(
                                    _.value1.toString(),
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              IconButton(
                                  padding: const EdgeInsets.all(0.0),
                                  constraints: BoxConstraints(),
                                  onPressed: () {
                                    _.dicrement1();
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.red,
                                  )),
                              SizedBox(
                                width: 10.w,
                              ),
                              IconButton(
                                  padding: const EdgeInsets.all(0.0),
                                  constraints: BoxConstraints(),
                                  onPressed: () {
                                    _.increment2();
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                  )),
                              Container(
                                height: 25.h,
                                width: 25.w,
                                decoration: BoxDecoration(
                                    color: AppColors.secondaryColor),
                                child: Center(
                                  child: CustomText(
                                    _.value2.toString(),
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              IconButton(
                                  padding: const EdgeInsets.all(0.0),
                                  constraints: BoxConstraints(),
                                  onPressed: () {
                                    _.dicrement3();
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.red,
                                  )),
                              SizedBox(
                                width: 10.w,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              CustomText(
                                "Quantity",
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              IconButton(
                                  padding: const EdgeInsets.all(0.0),
                                  constraints: BoxConstraints(),
                                  onPressed: () {
                                    _.increment1();
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                  )),
                              Container(
                                height: 25.h,
                                width: 25.w,
                                decoration: BoxDecoration(
                                    color: AppColors.secondaryColor),
                                child: Center(
                                  child: CustomText(
                                    _.value1.toString(),
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              IconButton(
                                  padding: const EdgeInsets.all(0.0),
                                  constraints: BoxConstraints(),
                                  onPressed: () {
                                    _.dicrement1();
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.red,
                                  )),
                              SizedBox(
                                width: 10.w,
                              ),
                              IconButton(
                                  padding: const EdgeInsets.all(0.0),
                                  constraints: BoxConstraints(),
                                  onPressed: () {
                                    _.increment2();
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                  )),
                              Container(
                                height: 25.h,
                                width: 25.w,
                                decoration: BoxDecoration(
                                    color: AppColors.secondaryColor),
                                child: Center(
                                  child: CustomText(
                                    _.value2.toString(),
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              IconButton(
                                  padding: const EdgeInsets.all(0.0),
                                  constraints: BoxConstraints(),
                                  onPressed: () {
                                    _.dicrement3();
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.red,
                                  )),
                              SizedBox(
                                width: 10.w,
                              ),
                              IconButton(
                                  padding: const EdgeInsets.all(0.0),
                                  constraints: BoxConstraints(),
                                  onPressed: () {
                                    _.increment3();
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                  )),
                              Container(
                                height: 25.h,
                                width: 25.w,
                                decoration: BoxDecoration(
                                    color: AppColors.secondaryColor),
                                child: Center(
                                  child: CustomText(
                                    _.value3.toString(),
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              IconButton(
                                  padding: const EdgeInsets.all(0.0),
                                  constraints: BoxConstraints(),
                                  onPressed: () {
                                    _.dicrement3();
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.red,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              CustomText(
                                "Price",
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                              SizedBox(
                                width: 37.w,
                              ),
                              IconButton(
                                  padding: const EdgeInsets.all(0.0),
                                  constraints: BoxConstraints(),
                                  onPressed: () {
                                    _.increment1();
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                  )),
                              Container(
                                height: 25.h,
                                width: 25.w,
                                decoration: BoxDecoration(
                                    color: AppColors.secondaryColor),
                                child: Center(
                                  child: CustomText(
                                    _.value1.toString(),
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              IconButton(
                                  padding: const EdgeInsets.all(0.0),
                                  constraints: BoxConstraints(),
                                  onPressed: () {
                                    _.dicrement1();
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.red,
                                  )),
                              SizedBox(
                                width: 10.w,
                              ),
                              IconButton(
                                  padding: const EdgeInsets.all(0.0),
                                  constraints: BoxConstraints(),
                                  onPressed: () {
                                    _.increment2();
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                  )),
                              Container(
                                height: 25.h,
                                width: 25.w,
                                decoration: BoxDecoration(
                                    color: AppColors.secondaryColor),
                                child: Center(
                                  child: CustomText(
                                    _.value2.toString(),
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              IconButton(
                                  padding: const EdgeInsets.all(0.0),
                                  constraints: BoxConstraints(),
                                  onPressed: () {
                                    _.dicrement3();
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.red,
                                  )),
                              SizedBox(
                                width: 10.w,
                              ),
                              IconButton(
                                  padding: const EdgeInsets.all(0.0),
                                  constraints: BoxConstraints(),
                                  onPressed: () {
                                    _.increment3();
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                  )),
                              Container(
                                height: 25.h,
                                width: 25.w,
                                decoration: BoxDecoration(
                                    color: AppColors.secondaryColor),
                                child: Center(
                                  child: CustomText(
                                    _.value3.toString(),
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              IconButton(
                                  padding: const EdgeInsets.all(0.0),
                                  constraints: BoxConstraints(),
                                  onPressed: () {
                                    _.dicrement3();
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.red,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Theme(
                            data: ThemeData.dark(),
                            child: Row(
                              children: [
                                CustomText(
                                  "Price Option",
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                ),
                                SizedBox(
                                  width: 40.w,
                                ),
                                Radio<int>(
                                    // fillColor: Color(),
                                    value: 0,
                                    groupValue: groupValue2,
                                    toggleable: true,
                                    onChanged: (int? value2) {
                                      setState(() {
                                        groupValue2 = value2;
                                      });
                                    }),
                                CustomText(
                                  selections2[0],
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                ),
                                SizedBox(
                                  width: 40.w,
                                ),
                                Radio<int>(
                                    // fillColor: Color(),
                                    value: 1,
                                    groupValue: groupValue2,
                                    toggleable: true,
                                    onChanged: (int? value2) {
                                      setState(() {
                                        groupValue2 = value2;
                                      });
                                    }),
                                CustomText(
                                  selections2[1],
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          CustomText(
                            "Document Type  ",
                            color: Colors.blue,
                            fontSize: 30.sp,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          HomeItem1(
                            cHeight: 35.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  onTap: () {},
                                  title: "SAVE",
                                  cWidth: Get.width,
                                  cHeight: 50.h,
                                ),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Expanded(
                                child: CustomButton(
                                  onTap: () {},
                                  title: "CANCEL",
                                  cWidth: Get.width,
                                  cHeight: 50.h,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      )));
            }));
  }
}

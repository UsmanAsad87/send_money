import 'dart:async';

import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:send_money/widgets/custom_button.dart';
import 'dart:math' show cos, sqrt, asin;

import '../constants.dart';
import '../utils/toast.dart';

class SendMoneyScreen extends StatefulWidget {
  static const routeName = '/send_money_screen';
  const SendMoneyScreen({Key? key}) : super(key: key);

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  String list1Value = "EUR";
  String list2Value = "EUR";

  List<DropdownMenuItem<String>> list1Items = [
    DropdownMenuItem(child: Text("EUR"), value: "EUR"),
    DropdownMenuItem(child: Text("USD"), value: "USD"),
    DropdownMenuItem(child: Text("PKR"), value: "PKR"),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.only(left: 25.w, top: 35.h, right: 25.w),
                      height: 158.h,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.r),
                          topLeft: Radius.circular(10.r),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: Color(0xFF1E1E1E).withOpacity(0.30),
                                ),
                                padding: EdgeInsets.only(
                                    top: 12.h, right: 12.w, left: 12.w),
                                height: 50.h,
                                width: 108.w,
                                child: DropdownButton(
                                    isExpanded: true,
                                    iconSize: 30,
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      color: Colors.black,
                                    ),
                                    dropdownColor: Colors.white70,
                                    borderRadius: BorderRadius.circular(12),
                                    underline: SizedBox(),
                                    value: list1Value,
                                    focusColor: Colors.white,
                                    style: kDropDownStyle,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        list1Value = newValue!;
                                      });
                                    },
                                    items: list1Items),
                              ),
                              Spacer(),
                              Text(
                                '500.00',
                                style: kHomeTextStyle,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            "Balance : 0.004",
                            style: kHomeTextStyle2,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(left: 25.w, top: 35.h, right: 25.w),
                      height: 158.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFF494949),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10.r),
                          bottomLeft: Radius.circular(10.r),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: Color(0xFF1E1E1E).withOpacity(0.30),
                                ),
                                padding: EdgeInsets.only(
                                    top: 12.h, right: 12.w, left: 12.w),
                                height: 50.h,
                                width: 108.w,
                                child: DropdownButton(
                                    isExpanded: true,
                                    iconSize: 30,
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      color: Colors.black,
                                    ),
                                    dropdownColor: Colors.white70,
                                    borderRadius: BorderRadius.circular(12),
                                    underline: SizedBox(),
                                    value: list1Value,
                                    focusColor: Colors.white,
                                    style: kDropDownStyle,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        list1Value = newValue!;
                                      });
                                    },
                                    items: list1Items),
                              ),
                              Spacer(),
                              Text(
                                '500.00',
                                style: kHomeTextStyle3,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            "Balance : 0.004",
                            style: kHomeTextStyle4,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 130.h,
                  left: MediaQuery.of(context).size.width / 2 - 40.w,
                  child: CircleAvatar(
                    radius: 30.r,
                    child: Container(
                      height: 76.h,
                      width: 76.w,
                      padding: EdgeInsets.all(16.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E1E1E),
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Center(
                          child: Image.asset(
                        'assets/sendImg.png',
                      )),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20.w, top: 15.h, right: 10.w),
                  height: 80.h,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3.w, 3.h),
                        blurRadius: 4.r,
                        color: Colors.black.withOpacity(0.25),
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            child: Image.asset('assets/flag.png'),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Nigeria',
                              style: kButton2TextStyle,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            size: 30,
                          ))
                    ],
                  ),
                ),
                Positioned(
                    left: 20,
                    top: 15,
                    child: Text(
                      'Destination',
                      style: kHomeTextStyle5,
                    )),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            CustomButton3(
              buttonText: 'Send Money',
              onPressed: () {},
            )
          ],
        ),
      ]),
    );
  }
}

import 'dart:async';

import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:send_money/screens/recieve_money.dart';
import 'package:send_money/screens/send_money.dart';
import 'package:send_money/widgets/custom_button.dart';
import 'dart:math' show cos, sqrt, asin;

import '../constants.dart';
import '../utils/toast.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  List<String> tabNames = [
    'Send Money',
    'Receive Money',
  ];
  late TabController _tabController;

  int currentIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: tabNames.length, vsync: this);
    super.initState();
  }

  buildTabRow(context) {
    return Container(
      width: double.infinity,
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF6D6D6D),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var i in tabNames)
              buildTabButton(
                  context: context,
                  title: i,
                  index: tabNames.indexOf(i),
                  function: () {}),
          ],
        ),
      ),
    );
  }

  buildTabButton(
      {required BuildContext context,
      required String title,
      required Function function,
      required int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = tabNames.indexOf(title);
        });
      },
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Container(
            width: MediaQuery.of(context).size.width / 2 - 40,

            decoration: BoxDecoration(
              color: tabNames.indexOf(title) == currentIndex
                  ? kPrimaryColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                tabNames.indexOf(title) == currentIndex
                    ? BoxShadow(
                        offset: Offset(3.w, 3.h),
                        blurRadius: 4.r,
                        color: Colors.black.withOpacity(0.25),
                      )
                    : BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 0.r,
                        color: Colors.transparent,
                      )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Center(child: Text(title, style: kHomeTextStyle6)),
            )),
      ),
    );
  }

  handleTabPages(BuildContext context, int index) {
    switch (index) {
      case 0:
        return const SendMoneyScreen();
      case 1:
        return const ReceiveMoneyScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
                padding: EdgeInsets.only(
                    top: kDefaultPadding,
                    left: kDefaultPadding,
                    right: kDefaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    Center(
                        child: Text(
                      'sendmoney',
                      style: kTitleStyle,
                    )),
                    SizedBox(
                      height: 40.h,
                    ),
                    buildTabRow(context),
                    handleTabPages(context, currentIndex),
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}

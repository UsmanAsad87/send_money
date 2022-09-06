import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:send_money/utils/loader.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.onPressed,
    required this.buttonText,
    this.isLoading = false,
    this.fillColor = const Color(0xFF312509),
  });
  final Function()? onPressed;
  final String buttonText;
  final bool isLoading;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0.w, 4.h),
            blurRadius: 4.r,
            color: Colors.black.withOpacity(0.25),
          )
        ],
      ),
      child: RawMaterialButton(
        elevation: 1,
        fillColor: fillColor,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: SizedBox(
          height: 50.h,
          width: 300.w,
          child: Center(
            child: isLoading
                ? spinKit(color: kButtonTextColor)
                : Text(buttonText, style: kBodyStyle3),
          ),
        ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  CustomButton2({
    required this.onPressed,
    required this.buttonText,
    this.isLoading = false,
  });
  final Function()? onPressed;
  final String buttonText;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(3.w, 3.h),
            blurRadius: 4.r,
            color: Colors.black.withOpacity(0.25),
          )
        ],
      ),
      child: RawMaterialButton(
        elevation: 2,
        fillColor: kPrimaryColor,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: SizedBox(
          height: 50.h,
          width: 300.w,
          child: Center(
            child: isLoading
                ? spinKit(color: kButtonTextColor)
                : Text(buttonText, style: kButton2TextStyle),
          ),
        ),
      ),
    );
  }
}

class CustomButton3 extends StatelessWidget {
  CustomButton3({
    required this.onPressed,
    required this.buttonText,
    this.isLoading = false,
  });
  final Function()? onPressed;
  final String buttonText;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(3.w, 3.h),
            blurRadius: 4.r,
            color: Colors.black.withOpacity(0.25),
          )
        ],
      ),
      child: RawMaterialButton(
        elevation: 2,
        fillColor: kPrimaryColor,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: SizedBox(
          height: 70.h,
          width: double.infinity,
          child: Center(
            child: isLoading
                ? spinKit(color: kButtonTextColor)
                : Text(buttonText, style: kButton2TextStyle),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onFieldSubmitted;
  final TextInputType? inputType;
  final bool obscure;
  final String? Function(String?)? validatorFn;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    required this.onFieldSubmitted,
    this.inputType,
    required this.obscure,
    this.validatorFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h, top: 5.h),
      padding:
          EdgeInsets.only(left: 20.w, top: 30.h, right: 10.w, bottom: 10.h),
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.w, 4.h),
            blurRadius: 4.r,
            color: Colors.black.withOpacity(0.2),
          )
        ],
      ),
      child: TextFormField(
        validator: validatorFn,
        obscureText: obscure,
        controller: controller,
        keyboardType: inputType,
        style: kBodyStyle1,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: kBodyStyle1a,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
      ),
    );
  }
}

class CustomTextField2 extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onFieldSubmitted;
  final TextInputType? inputType;
  final bool obscure;
  const CustomTextField2({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    required this.onFieldSubmitted,
    this.inputType,
    required this.obscure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h, top: 5.h),
      padding:
          EdgeInsets.only(left: 20.w, top: 20.h, right: 10.w, bottom: 10.h),
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.w, 4.h),
            blurRadius: 4.r,
            color: Colors.black.withOpacity(0.25),
          )
        ],
      ),
      child: TextFormField(
        obscureText: obscure,
        controller: controller,
        keyboardType: inputType,
        style: kBodyStyle1,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: kBodyStyle1a,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
      ),
    );
  }
}

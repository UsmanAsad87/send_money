import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:send_money/screens/login_screen.dart';
import 'package:send_money/screens/signup_screen.dart';
import 'package:send_money/utils/validator.dart';
import 'package:send_money/widgets/custom_button.dart';
import 'package:send_money/widgets/custom_text_field.dart';

import '../constants.dart';
import '../resources/auth_methods.dart';
import '../utils/toast.dart';

class FirstScreen extends StatefulWidget {
  static const routeName = '/login_screen';
  const FirstScreen({
    Key? key,
  }) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _emailController = TextEditingController();
  GlobalKey<FormState> forgetPassKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: Container(
            width: double.infinity,
            height: 420.h,
            decoration: BoxDecoration(
              color: kFirstContainerColor,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  offset: Offset(3.w, 3.h),
                  blurRadius: 4.r,
                  color: Colors.black.withOpacity(0.25),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 35.w, right: 35.w, top: 70.h),
              child: Column(
                children: [
                  Text(
                    'sendmoney',
                    style: kTitleStyle,
                  ),
                  SizedBox(
                    height: 20.w,
                  ),
                  CustomButton2(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => LoginScreen()));
                      },
                      buttonText: 'Log In'),
                  SizedBox(
                    height: 20.w,
                  ),
                  Text(
                    'OR',
                    style: kOrStyle,
                  ),
                  SizedBox(
                    height: 20.w,
                  ),
                  CustomButton2(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => SignupScreen()));
                      },
                      buttonText: 'SignUp'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

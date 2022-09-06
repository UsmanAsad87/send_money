import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:send_money/screens/login_screen.dart';
import 'package:send_money/utils/validator.dart';
import 'package:send_money/widgets/custom_button.dart';
import 'package:send_money/widgets/custom_text_field.dart';

import '../constants.dart';
import '../resources/auth_methods.dart';
import '../utils/toast.dart';

class ForgetPassScreen extends StatefulWidget {
  static const routeName = '/login_screen';
  const ForgetPassScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ForgetPassScreenState createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
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
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              child: Padding(
                padding: EdgeInsets.only(left: 35.w, right: 35.w, top: 90.h),
                child: Center(
                    child: Text(
                  'sendmoney',
                  style: kTitleStyle,
                )),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: (size.height * 0.25),
              child: Container(
                height: size.height - (size.height * 0.25),
                padding: EdgeInsets.only(left: 30.w, right: 30.w),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(50.r),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(5.w, -3.h),
                      blurRadius: 20.r,
                      color: Colors.black.withOpacity(0.2),
                    )
                  ],
                ),
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: kSecondaryColor,
                              size: 40.h,
                            )),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          'Forgot Password',
                          style: kHeadingStyle1,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'Email',
                          style: kHeadingStyle2,
                        ),
                        Form(
                          key: forgetPassKey,
                          child: CustomTextField(
                              obscure: false,
                              validatorFn: emailValidator,
                              inputType: TextInputType.emailAddress,
                              controller: _emailController,
                              hintText: 'Enter your email',
                              onChanged: (val) {},
                              onFieldSubmitted: (val) {}),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                            child: CustomButton(
                                onPressed: () async {
                                  showToast('Reset password email is sent.');
                                  await Future.delayed(
                                          Duration(milliseconds: 2000), () {})
                                      .then((value) => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => LoginScreen())));
                                },
                                // onPressed: () async {
                                //   if (_emailController.text.isEmpty) {
                                //     showFlagMsg(
                                //         context: context,
                                //         msg: 'Enter the email',
                                //         textColor: Colors.red);
                                //     return null;
                                //   }
                                //   final form = forgetPassKey.currentState;
                                //   if (form!.validate()) {
                                //     setState(() {
                                //       _isLoading = true;
                                //     });
                                //     String res = await AuthMethods()
                                //         .resetPassword(email: _emailController.text);
                                //     if (res == "success") {
                                //       setState(() {
                                //         _isLoading = false;
                                //       });
                                //       showToast('Reset password email is sent.');
                                //       await Future.delayed(Duration(milliseconds: 2000), () {})
                                //           .then((value) => Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen())));
                                //     } else {
                                //       showFlagMsg(
                                //           context: context, msg: res, textColor: Colors.red);
                                //     }
                                //     setState(() {
                                //       _isLoading = false;
                                //     });
                                //
                                //   } else {
                                //     showFlagMsg(
                                //         context: context,
                                //         msg: 'Enter the proper email',
                                //         textColor: Colors.red);
                                //   }
                                // },
                                buttonText: 'Reset Password')),
                        SizedBox(
                          height: 40.h,
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

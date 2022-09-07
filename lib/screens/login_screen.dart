import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:send_money/screens/forget_pass.dart';
import 'package:send_money/screens/signup_screen.dart';

import '../constants.dart';
import '../resources/auth_methods.dart';
import '../utils/toast.dart';
import '../utils/validator.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'main_menu.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login_screen';
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  GlobalKey<FormState> loginInKey = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
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
              top: (size.height * 0.22),
              child: Container(
                height: size.height - (size.height * 0.22),
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
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        Text(
                          'Login',
                          style: kHeadingStyle1,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Form(
                          key: loginInKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email',
                                style: kHeadingStyle2,
                              ),
                              CustomTextField(
                                  validatorFn: emailValidator,
                                  obscure: false,
                                  controller: _emailController,
                                  hintText: 'Enter your email',
                                  onChanged: (val) {},
                                  onFieldSubmitted: (val) {}),
                              Text(
                                'Password',
                                style: kHeadingStyle2,
                              ),
                              CustomTextField(
                                  validatorFn: passValidator,
                                  obscure: true,
                                  controller: _passController,
                                  hintText: 'Enter your password',
                                  onChanged: (val) {},
                                  onFieldSubmitted: (val) {}),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ForgetPassScreen()));
                          },
                          child: Align(
                              alignment: Alignment.centerRight,
                              child:
                                  Text('Forget Password?', style: kBodyStyle2)),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                            child: CustomButton(
                                isLoading: _isLoading,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => MainMenu()));
                                }
                                /*() async {
                                  if (_emailController.text.isEmpty ||
                                      _passController.text.isEmpty) {
                                    showFlagMsg(
                                        context: context,
                                        msg: 'Enter all Fields',
                                        textColor: Colors.red);
                                    return null;
                                  }
                                  final form = loginInKey.currentState;
                                  if (form!.validate()) {
                                    form.save();
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    String res = await AuthMethods().loginUser(
                                        email: _emailController.text,
                                        password: _passController.text);
                                    if (res == "success") {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      Navigator.push(context, MaterialPageRoute(builder: (_)=>MainMenu()));
                                    } else {
                                      showFlagMsg(
                                          context: context, msg: res, textColor: Colors.red);
                                    }
                                    setState(() {
                                      _isLoading = false;
                                    });
                                  } else {
                                    showFlagMsg(
                                        context: context,
                                        msg: 'Required fields are missing',
                                        textColor: Colors.red);
                                  }
                                }, */
                                ,
                                buttonText: 'Login')),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assets/fb.png',
                                    scale: 2,
                                  )),
                              SizedBox(
                                width: 15.w,
                              ),
                              InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assets/twitter.png',
                                    scale: 2,
                                  )),
                              SizedBox(
                                width: 15.w,
                              ),
                              InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assets/linkedin.png',
                                    scale: 2,
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Align(
                              alignment: Alignment.center,
                              child: Text('Don’t have an account?',
                                  style: kBodyStyle2)),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                            child: CustomButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => SignupScreen()));
                                },
                                buttonText: 'Sign Up')),
                        SizedBox(
                          height: 100.h,
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

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:send_money/constants.dart';
import 'package:send_money/resources/auth_methods.dart';
import 'package:send_money/screens/login_screen.dart';
import 'package:send_money/utils/toast.dart';
import 'package:send_money/utils/validator.dart';
import 'package:send_money/widgets/custom_button.dart';
import 'package:send_money/widgets/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup_screen';
  const SignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cryptoKeyController = TextEditingController();
  final TextEditingController _passConfirmController = TextEditingController();
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _nameController.dispose();
    _addController.dispose();
    _phoneController.dispose();
    _cryptoKeyController.dispose();
    _passConfirmController.dispose();
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
                        Text(
                          'Sign Up',
                          style: kHeadingStyle1,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Form(
                          key: signUpKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                style: kHeadingStyle2,
                              ),
                              CustomTextField(
                                  validatorFn: uNameValidator,
                                  obscure: false,
                                  controller: _nameController,
                                  hintText: 'Enter your name',
                                  onChanged: (val) {},
                                  onFieldSubmitted: (val) {}),
                              Text(
                                'Email',
                                style: kHeadingStyle2,
                              ),
                              CustomTextField(
                                  obscure: false,
                                  validatorFn: emailValidator,
                                  controller: _emailController,
                                  hintText: 'Enter your email',
                                  onChanged: (val) {},
                                  onFieldSubmitted: (val) {}),
                              Text(
                                'Address',
                                style: kHeadingStyle2,
                              ),
                              CustomTextField(
                                  obscure: false,
                                  controller: _addController,
                                  hintText: 'Enter your address',
                                  onChanged: (val) {},
                                  onFieldSubmitted: (val) {}),
                              Text(
                                'Contact No.',
                                style: kHeadingStyle2,
                              ),
                              CustomTextField(
                                  obscure: false,
                                  validatorFn: phoneValidator,
                                  inputType: TextInputType.phone,
                                  controller: _phoneController,
                                  hintText: 'Enter your contact no.',
                                  onChanged: (val) {},
                                  onFieldSubmitted: (val) {}),
                              Text(
                                'Crypto Wallet Key',
                                style: kHeadingStyle2,
                              ),
                              CustomTextField(
                                  obscure: false,
                                  controller: _cryptoKeyController,
                                  hintText: 'Enter your crypto wallet key',
                                  onChanged: (val) {},
                                  onFieldSubmitted: (val) {}),
                              Text(
                                'Password',
                                style: kHeadingStyle2,
                              ),
                              CustomTextField(
                                  obscure: true,
                                  validatorFn: passValidator,
                                  controller: _passController,
                                  hintText: 'Enter your password',
                                  onChanged: (val) {},
                                  onFieldSubmitted: (val) {}),
                              Text(
                                'Confirm Password',
                                style: kHeadingStyle2,
                              ),
                              CustomTextField(
                                  obscure: true,
                                  validatorFn: passValidator,
                                  controller: _passConfirmController,
                                  hintText: 'Re-enter your password',
                                  onChanged: (val) {},
                                  onFieldSubmitted: (val) {}),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                            child: CustomButton(
                                isLoading: _isLoading,
                                onPressed: () {
                                  showToast('Account Created Successfully');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => LoginScreen()));
                                }
                                /* () async {
                                  if (_emailController.text.isEmpty ||
                                      _passController.text.isEmpty ||
                                      _nameController.text.isEmpty ||
                                      _phoneController.text.isEmpty ||
                                      _addController.text.isEmpty ||
                                      _cryptoKeyController.text.isEmpty ||
                                      _passConfirmController.text.isEmpty) {
                                    showFlagMsg(
                                        context: context,
                                        msg: 'Enter all required fields',
                                        textColor: Colors.red);
                                    return null;
                                  }
                                  if (_passConfirmController.text !=
                                      _passController.text) {
                                    showFlagMsg(
                                        context: context,
                                        msg: 'Password didn\'t match',
                                        textColor: Colors.red);
                                    return null;
                                  }
                                  final form = signUpKey.currentState;
                                  if (form!.validate()) {
                                    form.save();
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    String res = await AuthMethods().signUpUser(
                                        email: _emailController.text,
                                        password: _passController.text,
                                        name: _nameController.text,
                                        phoneNumber: _phoneController.text,
                                        address: _addController.text,
                                        cryptoWalletKey:
                                            _cryptoKeyController.text);
                                    setState(() {
                                      _isLoading = false;
                                    });
                                    if (res != 'success') {
                                      showFlagMsg(
                                          context: context,
                                          msg: res,
                                          textColor: Colors.red);
                                    } else {
                                      showToast('Account Created Successfully');
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => const LoginScreen()));
                                    }
                                  } else {
                                    showFlagMsg(
                                        context: context,
                                        msg: 'Required fields are missing',
                                        textColor: Colors.red);
                                  }
                                },*/
                                ,
                                buttonText: 'Sign Up')),
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
                                  onTap: () {
                                    //AuthMethods().signInWithGoogle(context);
                                  },
                                  child: Image.asset(
                                    'assets/linkedin.png',
                                    scale: 2,
                                  )),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Align(
                              alignment: Alignment.center,
                              child: Text('Already have an account?',
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
                                          builder: (_) => LoginScreen()));
                                },
                                buttonText: 'Login')),
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

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:send_money/constants.dart';
import 'package:send_money/resources/auth_methods.dart';
import 'package:send_money/widgets/custom_button.dart';

import '../Models/UserModel.dart';
import '../provider/user_provider.dart';
import '../utils/select_image.dart';
import '../utils/toast.dart';
import '../widgets/custom_text_field.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile_screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  Uint8List? _image;

  @override
  void dispose() {
    _emailController.dispose();
    _ageController.dispose();
    _nameController.dispose();
    _addController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final UserModel user = Provider.of<UserProvider>(context).getUser;
    // _nameController.text = user.name;
    // _emailController.text = user.email;
    // _ageController.text = user.age;
    // _addController.text = user.address;
    // _phoneController.text = user.phoneNumber;

    bool _isLoading = false;
    GlobalKey<FormState> profileKey = GlobalKey<FormState>();

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome Back',
                              style: kBodyStyle9,
                            ),
                            Text(
                              'John Doe',
                              style: kBodyStyle9,
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            CircleAvatar(
                                radius: 40.r,
                                backgroundImage: NetworkImage(networkImageUrl)),
                            Positioned(
                                right: 0,
                                bottom: 0,
                                child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: kEditButtonColor,
                                    child: Center(
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.edit,
                                              size: 15,
                                              color: kPrimaryColor,
                                            )))))
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    BalanceTile(cash: '40', dateTime: DateTime.now()),
                    SizedBox(
                      height: 30.h,
                    ),
                    Form(
                      key: profileKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Full Name',
                            style: kHeadingStyle3,
                          ),
                          CustomTextField2(
                              obscure: false,
                              controller: _nameController,
                              hintText: '',
                              onChanged: (val) {},
                              onFieldSubmitted: (val) {}),
                          Text(
                            'Email',
                            style: kHeadingStyle3,
                          ),
                          CustomTextField2(
                              obscure: false,
                              controller: _emailController,
                              hintText: '',
                              onChanged: (val) {},
                              onFieldSubmitted: (val) {}),
                          Text(
                            'Age',
                            style: kHeadingStyle3,
                          ),
                          CustomTextField2(
                              obscure: false,
                              controller: _ageController,
                              hintText: '',
                              onChanged: (val) {},
                              onFieldSubmitted: (val) {}),
                          Text(
                            'Address',
                            style: kHeadingStyle3,
                          ),
                          CustomTextField2(
                              obscure: false,
                              controller: _addController,
                              hintText: '',
                              onChanged: (val) {},
                              onFieldSubmitted: (val) {}),
                          Text(
                            'Contact',
                            style: kHeadingStyle3,
                          ),
                          CustomTextField2(
                              obscure: false,
                              inputType: TextInputType.phone,
                              controller: _phoneController,
                              hintText: '',
                              onChanged: (val) {},
                              onFieldSubmitted: (val) {}),
                        ],
                      ),
                    ),
                    Center(
                        child: CustomButton(
                            fillColor: Colors.black.withOpacity(0.8),
                            isLoading: _isLoading,
                            onPressed: () {
                              showToast('Account Updated Successfully');
                            }
                            /*() async {
                            if (_emailController.text.isEmpty ||
                                _ageController.text.isEmpty ||
                                _nameController.text.isEmpty ||
                                _phoneController.text.isEmpty ||
                                _addController.text.isEmpty) {
                              showFlagMsg(
                                  context: context,
                                  msg: 'Enter all required fields',
                                  textColor: Colors.red);
                              return null;
                            }
                            final form = profileKey.currentState;
                            if (form!.validate()) {
                              form.save();
                              setState(() {
                                _isLoading = true;
                              });
                              String res = await AuthMethods().updateUser(
                                  file: _image,
                                  email: _emailController.text,
                                  age: _ageController.text,
                                  name: _nameController.text,
                                  phoneNumber: _phoneController.text,
                                  address: _addController.text,
                                  context: context,
                                  userdata: user);
                              setState(() {
                                _isLoading = false;
                              });
                              if (res != 'success') {
                                showFlagMsg(
                                    context: context,
                                    msg: res,
                                    textColor: Colors.red);
                              } else {
                                showToast('Account Updated Successfully');
                              }
                            } else {
                              showFlagMsg(
                                  context: context,
                                  msg: 'Required fields are missing',
                                  textColor: Colors.red);
                            }
                          },*/
                            ,
                            buttonText: 'Update Profile')),
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}

class BalanceTile extends StatelessWidget {
  final String cash;
  final DateTime dateTime;
  const BalanceTile({
    Key? key,
    required this.cash,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Container(
        height: 100.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: const Color(0xFF2B2B2B),
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.w, 4.h),
              blurRadius: 4.r,
              color: Colors.black.withOpacity(0.25),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: Stack(
                    children: [
                      Positioned(
                          left: 0,
                          bottom: 5,
                          child: Text(
                            '${DateFormat.MMMd().format(dateTime)} - ${DateFormat.jm().format(dateTime)}',
                            style: kBodyStyle10,
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0.h),
                        child: Text(
                          'Balance',
                          style: kBodyStyle9,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              '\$$cash',
              style: kBodyStyle9,
            )
          ],
        ),
      ),
    );
  }
}

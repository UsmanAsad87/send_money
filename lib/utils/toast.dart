import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// flutter toast
void showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.SNACKBAR,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 15.0,
  );
}

// bottom toast
void showFlagMsg(
    {required BuildContext context,
    required String msg,
    required Color textColor}) {
  final size = MediaQuery.of(context).size;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return ListTile(
        dense: true,
        minLeadingWidth: 0,
        horizontalTitleGap: 0,
        leading: Icon(
          Icons.error,
          color: textColor,
          size: 18,
        ),
        title: Text(
          msg,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: size.height * 0.02, color: textColor),
        ),
      );
    },
  );
}

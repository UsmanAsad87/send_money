import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget spinKit({Color? color}) => SpinKitThreeBounce(
      color: color ?? Colors.white,
      size: 20.0,
    );

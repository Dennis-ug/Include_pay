import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screens/Otp/otp.dart';
import 'Screens/intro/intro.dart';

void main() {
  //  GlobalBindings().dependencies();
  runApp(IncludePay());
}

class IncludePay extends StatelessWidget {
  const IncludePay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: null,
        textTheme: TextTheme(),
        primaryColor: Color.fromRGBO(0, 179, 13, 1),
        primaryTextTheme: TextTheme(
          bodyText1: TextStyle(fontFamily: " Poppins-reg"),
        ),
      ),
      home:
          // OptView()
          Intro(),
    );
  }
}

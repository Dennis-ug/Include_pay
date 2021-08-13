import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      home: Intro(),
    );
  }
}

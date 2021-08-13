import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:includepay/Screens/Error%20Screen/error.dart';
import 'package:includepay/Screens/Otp/otp.dart';
import 'package:includepay/Screens/baseScreen/mainBase.dart';

class SignInController extends GetxController {
  late String paswKey;
  late String phoneNum;
  final GlobalKey<FormState> signInForm = GlobalKey<FormState>();
  late TextEditingController phoneController, passwordController;
  var iSReady = false.obs;
  @override
  void onInit() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  String? validatePhone(String? value) {
    if (value == "") {
      return "This field can't be empty";
    } else if (!value!.startsWith("07")) {
      return "Invalid number";
    }
  }

  String? validatePassword(String? value) {
    if (value == "") {
      return "This field can't be empty";
    } else if (value!.length == 6) {
      return "Pasword too short";
    } else if (!GetUtils.hasCapitalletter(value)) {
      return "Password has to contain a capital letter";
    }
  }

  validate() {
    final isValide = signInForm.currentState!.validate();
    if (!isValide) {
      return;
    } else {
      signInForm.currentState!.save();

      return "Correct";
    }
  }

  void savePwd(String value) {
    paswKey = value;
  }

  void savePhone(String value) {
    phoneNum = value;
  }

  Future signIn() async {
    iSReady.value = true;
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Cookie': 'PHPSESSID=78bf56f55656e140c02fab0318fe15d1'
      };
      var request = http.Request(
        'POST',
        Uri.parse('https://wallet.ahuriire.com/authenticate/'),
      );
      request.body = json.encode(
        {"contact": "$phoneNum", "password": "$paswKey"},
      );
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var cont = await response.stream.bytesToString();
        var body = jsonDecode(cont);
        print(body);
        iSReady.value = false;

        switch (body["status"]) {
          case 201:
            {
              Get.to(() => BaseView());
            }
            break;
          case 202:
            {
              Get.to(() => OptView());
            }
            break;
          case 421:
            {
              dialog(body["message"]);
            }
            break;
          case 422:
            {
              dialog(body["message"]);
            }
            break;
        }
        //   if (body["message"] == "Login Successful") {
        //     Get.to(() => BaseView());
        //   } else if (body["message"] == "Invalid Password!") {
        //     dialog(body["message"]);
        //     // Get.to(() => ErrorView(
        //     //       msg: body["message"],
        //     //     ));
        //   } else if (body["message"] == "Invalid Username") {
        //     dialog(body["message"]);
        //     // Get.to(() => ErrorView(

        //     //       msg: body["message"],
        //     //     ));
        //     print("User name doesnt exit or incorect");
        //   } else if (body["status"] == "421") {
        //     dialog(body["message"]);
        //     // Get.to(() => ErrorView(dialog(body["message"]);

        //     //       msg: body["message"],
        //     //     ));
        //     print("User name doesnt exit or incorect");
        //   }
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }

  void dialog(String msg) {
    Get.defaultDialog(
      title: "Warning",
      middleText: msg,
      radius: 8,
    );
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:includepay/Screens/Otp/otp.dart';
import 'package:includepay/Screens/baseScreen/mainBase.dart';
import 'package:includepay/constants/constants.dart';
import 'package:includepay/tools/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInController extends GetxController {
  late String paswKey;
  late String phoneNum;
  final GlobalKey<FormState> signInForm = GlobalKey<FormState>();
  late TextEditingController phoneController, passwordController;
  var iSReady = false.obs;
  var isNotVissible = true.obs;
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
    } else if (!value!.startsWith("07") && value.length != 11) {
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

      http.StreamedResponse response =
          await request.send().timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        SharedPreferences _pref = await SharedPreferences.getInstance();
        var cont = await response.stream.bytesToString();
        var body = jsonDecode(cont);
        print(body);
        String _msg = body["message"];
        iSReady.value = false;

        switch (body["status"]) {
          case 201:
            {
              Get.to(() => BaseView());
              _pref.setBool(userSignedIn, true);
            }
            break;
          case 202:
            {
              Get.to(() => OptView());
            }
            break;
          case 421:
            {
              dialog(_msg);
            }
            break;
          case 422:
            {
              dialog("$_msg\nTry creating an account \n this number");
            }
            break;
        }
      } else {
        iSReady.value = false;
        print(response.reasonPhrase);
      }
    } on SocketException {
      iSReady.value = false;
      dialog(
        "Failed to connect to the server\n Please check your data connect",
      );
    } on TimeoutException {
      dialog(
        "System has taken log to respond\n This may be due to slow internet",
      );
    }
    // on HandshakeException {

    //   iSReady.value = false;
    //   dialog(
    //     "Procese interupted\n Try again later",
    //   );
    // }
    catch (e) {
      print(e);
      // if (e == Exception.)
      iSReady.value = false;
      print("Failed due to $e");
      dialog("$e");
    }
  }

  void visi() {
    if (!isNotVissible.value) {
      isNotVissible.value = true;
    } else {
      isNotVissible.value = false;
    }
  }

  void dialog(String msg) {
    Get.defaultDialog(title: "Warning", middleText: msg, radius: 8, actions: [
      TextButton(
          onPressed: () => Get.back(),
          child: Text(
            "Ok",
            style: TextStyle(color: greenLight),
          ))
    ]);
  }
}

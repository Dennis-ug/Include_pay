import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:includepay/Screens/Otp/otp.dart';

class SignUpController extends GetxController {
  late String name;
  late String email;
  late String phone;
  late String paswKey;
  var isNotVissible = true.obs;

  final GlobalKey<FormState> signUpForm = GlobalKey<FormState>();
  late TextEditingController phoneController,
      passwordController,
      emailController,
      confirmPasswordt,
      nameController;
  @override
  void onInit() {
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    confirmPasswordt = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordt.dispose();
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
    } else if (!value.isNumericOnly) {
      return "Number can't contain an alphabets";
    } else if (value.length < 10) {
      return "number incomplete";
    }
  }

  String? validatePassword(String? value) {
    if (value == "") {
      return "This field can't be empty";
    } else if (!(value!.length >= 6)) {
      return "Pasword too short";
    } else if (!GetUtils.hasCapitalletter(value)) {
      return "Password has to contain a capital letter";
    } else if (GetUtils.isAlphabetOnly(value)) {
      return "Pawssword must contain anumber";
    }
  }

  String? validateName(String? value) {
    if (value == "") {
      return "This field can't be empty";
    }
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "This field can't be empty";
    } else if (!GetUtils.isEmail(value)) {
      return "invalid Email";
    }
  }

  String? confirmPassword(String? value) {
    if (!(value == passwordController.text)) {
      return "Password not matchin";
    } else if (!GetUtils.hasCapitalletter(value!)) {
      return "Password must contain a capital letter";
    }
    //
  }

  validate() {
    final isValide = signUpForm.currentState!.validate();
    if (!isValide) {
      return;
    } else {
      signUpForm.currentState!.save();
      return "correct";
    }
  }

  void savePwd(String value) {
    paswKey = value;
  }

  void saveName(String value) {
    name = value;
  }

  void savePhone(String value) {
    phone = value;
  }

  Future signUp() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Cookie': 'PHPSESSID=78bf56f55656e140c02fab0318fe15d1'
      };
      var request = http.Request(
          'POST', Uri.parse('https://wallet.ahuriire.com/signup/'));
      request.body = json.encode({
        "phone": "$phone",
        "name": "$name",
        "email": "$email",
        "password": "$paswKey"
      });
      request.headers.addAll(headers);

      http.StreamedResponse response =
          await request.send().timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        var res = await response.stream.bytesToString();
        print(res);
        var body = jsonDecode(res);
        int _statusCode = body["status"];
        String _message = body["message"];
        switch (_statusCode) {
          case 201:
            {
              Get.off(() => OptView());
            }
            break;

          case 420:
            {
              _dialog(msg: _message, sc: _statusCode);
            }
            break;
          case 421:
            {
              _dialog(msg: _message, sc: _statusCode);
            }
        }
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      _dialog(msg: "$e");
    }
  }

  void visi() {
    if (!isNotVissible.value) {
      isNotVissible.value = true;
    } else {
      isNotVissible.value = false;
    }
  }

  void _dialog({required String msg, sc}) {
    Get.defaultDialog(
        title: "Warning",
        middleText: "$msg \n ",
        radius: 8,
        confirm: TextButton(
          onPressed: () {
            switch (sc) {
              case 420:
                {
                  phoneController.text = "";
                }
                break;
            }
            Get.back();
          },
          child: Text("Ok"),
        ));
  }
}

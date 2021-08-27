import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OtpController extends GetxController {
  late TextEditingController pinControler;
  var isReady = false.obs;
  var isSubmmiting = false.obs;
  @override
  void onInit() {
    pinControler = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    pinControler.dispose();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void test() {
    print(pinControler.text);
  }

  Future otpVarification() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=78bf56f55656e140c02fab0318fe15d1'
    };
    var request = http.Request(
        'POST', Uri.parse('https://wallet.ahuriire.com/verification/'));
    request.body = json.encode({
      "otp": pinControler.text,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var cont = await response.stream.bytesToString();
      var body = jsonDecode(cont);
      print(body);
      // iSReady.value = false;

      switch (body["status"]) {
        case 201:
          {
            // Get.off(() => BaseView());
            // Get.to(() => BaseView());
          }
          break;
        // case 202:
        //   {
        //     Get.to(() => OptView());
        //   }
        //   break;
        // case 421:
        //   {
        //     _dialog(body["message"]);
        //   }
        //   break;
        // case 422:
        //   {
        //     _dialog(body["message"]);
        //   }
        //   break;
      }
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
    // var headers = {
    //   'Content-Type': 'application/json',
    //   'Cookie': 'PHPSESSID=5ed627c385e2ef666e927ad4de45fedf'
    // };
    // var request = http.Request(
    //     'POST', Uri.parse('https://wallet.ahuriire.com/verification/'));
    // request.body = json.encode({"otp": "97707"});
    // request.headers.addAll(headers);

    // http.StreamedResponse response = await request.send();

    // if (response.statusCode == 200) {
    //   print(await response.stream.bytesToString());
    //   print("submited value is $value");
    //   // isReady.value = true;
    //   // isSubmmiting.value = true;
    //
    // } else {
    //   print(response.reasonPhrase);
    // }
  }
}

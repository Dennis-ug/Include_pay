import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:includepay/Screens/baseScreen/mainBase.dart';

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
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    pinControler.dispose();
    super.dispose();
  }

  void test() {
    print(pinControler.text);
  }

  Future otpVarification() async {
    try {
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
              Get.off(() => BaseView());
              // Get.to(() => BaseView());
            }
            break;
          case 202:
            {
              // Get.to(() => OptView());
            }
            break;
          case 426:
            {
              // _dialog(body["message"]);
            }
            break;
          case 422:
            {
              // _dialog(body["message"]);
            }
            break;
        }
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {}
  }

  // void _dialog({required String msg, sc}) {
  //   Get.defaultDialog(
  //       title: "Warning",
  //       middleText: "$msg \n ",
  //       radius: 8,
  //       confirm: TextButton(
  //         onPressed: () {
  //           switch (sc) {
  //             case 420:
  //               {
  //                 // phoneController.text = "";
  //               }
  //               break;
  //           }
  //           Get.back();
  //         },
  //         child: Text("Ok"),
  //       ));
  // }
}

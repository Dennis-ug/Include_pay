import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:includepay/Screens/services/Success/Succees.dart';
import 'package:includepay/tools/colors.dart';

class SavingsContro extends GetxController {
  late String scoId;
  @override
  final GlobalKey<FormState> savingDepositingsForm = GlobalKey<FormState>();
  var isLoading = false.obs;
  late String _accountId;
  late TextEditingController saconame,
      phoneNumber,
      accountNumaber,
      amount,
      reason;
  var iSReady = false.obs;
  void onInit() {
    saconame = TextEditingController();
    saconame = TextEditingController();
    phoneNumber = TextEditingController();
    accountNumaber = TextEditingController();
    amount = TextEditingController();
    reason = TextEditingController();
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
    saconame.dispose();
    phoneNumber.dispose();
    accountNumaber.dispose();
    amount.dispose();
    reason.dispose();
    // savingDepositingsForm.dispose();
    super.dispose();
  }

  String? validatePhone(String? value) {
    if (value == "") {
      return "This field can't be empty";
    } else if (!value!.startsWith("07") && value.length != 11) {
      return "Invalid number";
    }
  }

  String? required(String? value) {
    if (value == "") {
      return "This field can't be empty";
    }
  }

  validate() {
    final isValide = savingDepositingsForm.currentState!.validate();
    if (!isValide) {
      return;
    } else {
      savingDepositingsForm.currentState!.save();
      accountValidate();

      return "Correct";
    }
  }

  Future accountValidate() async {
    try {
      isLoading.value = true;
      var headers = {'Cookie': 'PHPSESSID=4150e94570d18faea2ee188328cb6ee2'};
      var request = http.Request(
        'GET',
        Uri.parse(
            'https://sacco.irembofinance.com/API/check-account/?saccoid=$scoId&account=${accountNumaber.text}'),
      );

      request.headers.addAll(headers);

      http.StreamedResponse response =
          await request.send().timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        isLoading.value = false;
        var _body = jsonDecode(
          await response.stream.bytesToString(),
        );
        _accountId = _body["accountid"];
        print(_body);

        Get.defaultDialog(
          title: "Info",
          middleText:
              "You are depositing Ush ${amount.text} to the account of ${_body["fname"]} ${_body["lname"]}'",
          radius: 8,
          actions: [
            TextButton(
              onPressed: () {
                isLoading.value = false;
                deposit();
                Get.back();
              },
              child: Text(
                "Ok",
                style: TextStyle(
                  color: greenLight,
                ),
              ),
            )
          ],
        );
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      dialog("$e");
      isLoading.value = false;
    }
  }

  Future deposit() async {
    isLoading.value = true;
    print("Starting");
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Cookie': 'PHPSESSID=4150e94570d18faea2ee188328cb6ee2'
      };
      var request = http.Request(
        'POST',
        Uri.parse('https://sacco.irembofinance.com/API/payment/'),
      );
      request.body = json.encode({
        "account": _accountId,
        "sacco": scoId,
        "contact": phoneNumber.text,
        "amount": amount.text,
        "notes": reason.text
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var raw = await response.stream.bytesToString();
        var body = jsonDecode(raw);
        if (body["status"] != 200) {
          dialog(body["message"]);
        } else {
          isLoading.value = false;
          Get.to(() => Succees());
          phoneNumber.clear();
          accountNumaber.clear();
          amount.clear();
          reason.clear();
          print(body);
        }
        print(
            "${accountNumaber.text},$scoId,${phoneNumber.text},${amount.text},${reason.text}");
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      isLoading.value = false;
      dialog("$e");
      isLoading.value = false;
    }
  }

  void dialog(String msg) {
    Get.defaultDialog(
      title: "Warning",
      middleText: msg,
      radius: 8,
      actions: [
        TextButton(
          onPressed: () {
            isLoading.value = false;
            Get.back();
          },
          child: Text(
            "Ok",
            style: TextStyle(color: greenLight),
          ),
        )
      ],
    );
  }
}

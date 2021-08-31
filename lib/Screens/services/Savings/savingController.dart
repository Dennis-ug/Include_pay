import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SavingsContro extends GetxController {
  @override
  final GlobalKey<FormState> savingDepositingsForm = GlobalKey<FormState>();
  late TextEditingController saconame, phoneNumber, accountNumaber, amount;
  var iSReady = false.obs;
  void onInit() {
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
    super.dispose();
  }

  Future deposit() async {
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
        "account": 2,
        "sacco": 7,
        "contact": "0770963649",
        "amount": 1000,
        "notes": "School fees"
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print("The error is $e");
    }
  }
}

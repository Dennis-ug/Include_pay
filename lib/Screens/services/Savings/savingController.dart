import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SavingsContro extends GetxController {
  @override
  late String paswKey;
  late String phoneNum;
  final GlobalKey<FormState> savingDepositings = GlobalKey<FormState>();
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

  Future deposit() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=78bf56f55656e140c02fab0318fe15d1'
    };
    var request = http.Request(
        'POST', Uri.parse('https://sacco.irembofinance.com/API/payment/'));
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
      var cont = await response.stream.bytesToString();
      var body = jsonDecode(cont);
      print(body);
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}

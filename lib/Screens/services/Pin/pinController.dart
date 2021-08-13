import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PinsControl extends GetxController {
  late PageController pageController;
  List<Container> cont = [];
  List pinData = [];
  var dotNum = 0.obs;

  @override
  void onInit() {
    pageController = PageController();
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

  void upDatePin(String? pin) {
    if (dotNum.value <= 3) {
      pinData.add(pin);
      dotNum += 1;

      print("This the pin $pin");
      print(pinData);
      print('Number of dots $dotNum');
    } else {
      print("Fields full");
    }
  }

  void del() {
    if (dotNum.value != 0) {
      dotNum -= 1;
      pinData.removeLast();
      print('Number of dots $dotNum');
    }
  }
}

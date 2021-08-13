import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TabControl extends GetxController {
  late PageController pageController;
  var currentIndex = 0.obs;
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
}

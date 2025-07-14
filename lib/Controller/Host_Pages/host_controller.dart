// controllers/home_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentPage = 2.obs;
  late PageController pageController;

  @override
  void onInit() {
    pageController = PageController(initialPage: currentPage.value);
    super.onInit();
  }

  void changePage(int index) {
    currentPage.value = index;
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

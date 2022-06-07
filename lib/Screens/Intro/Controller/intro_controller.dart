import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/MainModel/GetRouts.dart';
import 'package:rubymessanger/Utils/StorageUtils.dart';

class IntroController extends GetxController {
  late final PageController pageController;

  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();

    pageController = PageController(
      initialPage: currentIndex.value,
    );
  }

  void changePage({required int index}) {
    currentIndex(index);
  }

  void goToPrevious() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    currentIndex(currentIndex.value - 1);
  }

  void goToNext() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    currentIndex(currentIndex.value + 1);
  }

  void goToRegisterScreen() async {
    StorageUtils.setFirstLogin(isFirst: true);
    Get.offAndToNamed(
      NameRouts.registerLogin,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animatedIconController;
  RxBool isCollapsed = false.obs;

  @override
  void onInit() {
    animatedIconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    super.onInit();
  }

  void openMenu()async {
    if(isCollapsed.isTrue){
      animatedIconController.reverse();
      isCollapsed(false);
    }else{
      animatedIconController.forward();
      isCollapsed(true);
    }
    update(['menu']);
  }
}

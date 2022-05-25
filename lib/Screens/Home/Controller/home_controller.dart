import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/MainModel/chat_model.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animatedIconController;
  RxBool isCollapsed = false.obs;

  RxBool isDark = false.obs;

  List<ChatModel> listOfChats = [
    ChatModel(
      fromMe: true,
      delivered: true,
      unreadMessage: 0.obs,
      title: 'Amin Khademi',
      image: 'assets/images/image.jpg',
      lastMessage: 'goftam bia inja',
      seen: true,
      isSelected: true.obs,
    ),
    ChatModel(
      fromMe: false,
      delivered: true,
      unreadMessage: 0.obs,
      title: 'Amin Khademi',
      image: 'assets/images/image.jpg',
      lastMessage: 'goftam bia inja',
      seen: true,
      isSelected: false.obs,
    ),
    ChatModel(
      fromMe: true,
      delivered: false,
      unreadMessage: 12.obs,
      title: 'Amin Khademi',
      image: '',
      lastMessage: 'goftam bia inja',
      seen: true,
      isSelected: false.obs,
    ),
    ChatModel(
      fromMe: true,
      delivered: true,
      unreadMessage: 0.obs,
      title: 'Amin Khademi',
      image: 'assets/images/image.jpg',
      lastMessage: 'goftam bia inja',
      seen: true,
      isSelected: false.obs,
    ),
    ChatModel(
      fromMe: false,
      delivered: true,
      unreadMessage: 0.obs,
      title: 'Amin Khademi',
      image: '',
      lastMessage: 'goftam bia inja',
      seen: true,
      isSelected: false.obs,
    ),
    ChatModel(
      fromMe: true,
      delivered: false,
      unreadMessage: 5.obs,
      title: 'Amin Khademi',
      image: 'assets/images/image.jpg',
      lastMessage: 'goftam bia inja',
      seen: true,
      isSelected: false.obs,
    ),
  ];

  @override
  void onInit() {
    if (Get.isDarkMode) {
      isDark(true);
    }
    animatedIconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 300),
    );

    update();

    super.onInit();
  }

  void openMenu() async {
    if (isCollapsed.isTrue) {
      animatedIconController.reverse();
      isCollapsed(false);
    } else {
      animatedIconController.forward();
      isCollapsed(true);
    }
    update(['menu']);
  }

  void changeTheme() {
    if (Get.isDarkMode) {
      Get.changeTheme(ThemeData.light());
      isDark(false);
    } else {
      Get.changeTheme(ThemeData.dark());
      isDark(true);
    }
    update(['theme']);
  }

  void selectChat({required ChatModel item}) {
    item.isSelected(true);
  }

  void tapOnChat({required ChatModel item}) {
    if (listOfChats.any((element) => element.isSelected.isTrue)) {
      item.isSelected(!item.isSelected.value);
    } else {
      print('single');
    }
  }
}

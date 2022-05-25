import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/MainModel/chat_model.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animatedIconController;
  RxBool isCollapsed = false.obs;

  List<ChatModel> listOfChats = [
    ChatModel(
      fromMe: true,
      delivered: true,
      unreadMessage: 0.obs,
      title: 'Amin Khademi',
      image: 'assets/images/image.jpg',
      lastMessage: 'goftam bia inja',
      seen: true,
    ),
    ChatModel(
      fromMe: false,
      delivered: true,
      unreadMessage: 0.obs,
      title: 'Amin Khademi',
      image: 'assets/images/image.jpg',
      lastMessage: 'goftam bia inja',
      seen: true,
    ),
    ChatModel(
      fromMe: true,
      delivered: false,
      unreadMessage: 12.obs,
      title: 'Amin Khademi',
      image: '',
      lastMessage: 'goftam bia inja',
      seen: true,
    ),
    ChatModel(
      fromMe: true,
      delivered: true,
      unreadMessage: 0.obs,
      title: 'Amin Khademi',
      image: 'assets/images/image.jpg',
      lastMessage: 'goftam bia inja',
      seen: true,
    ),
    ChatModel(
      fromMe: false,
      delivered: true,
      unreadMessage: 0.obs,
      title: 'Amin Khademi',
      image: '',
      lastMessage: 'goftam bia inja',
      seen: true,
    ),
    ChatModel(
      fromMe: true,
      delivered: false,
      unreadMessage: 5.obs,
      title: 'Amin Khademi',
      image: 'assets/images/image.jpg',
      lastMessage: 'goftam bia inja',
      seen: true,
    ),
  ];

  @override
  void onInit() {
    animatedIconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

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
    Get.changeTheme(
      (Get.isDarkMode) ? ThemeData.light() : ThemeData.dark(),
    );
  }
}

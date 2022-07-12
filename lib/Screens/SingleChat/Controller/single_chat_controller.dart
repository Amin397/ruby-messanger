import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/MainModel/GetRouts.dart';
import 'package:rubymessanger/Utils/project_request_utils.dart';
import 'package:rubymessanger/main.dart';

import '../../../MainModel/chat_model.dart';
import '../../../MainModel/user_model.dart';

class SingleChatController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final AnimationController animationController;
  ProjectRequestUtils request = ProjectRequestUtils();

  RoomModel? roomModel;
  UserModel? userModel;
  int index = 0;
  int pvId = 0;

  RxBool isSearchClicked = false.obs;
  bool fromHome = false;

  TextEditingController searchTextController = TextEditingController();
  TextEditingController messageTextController = TextEditingController();

  int limitMessage = 15;
  int offsetMessage = 0;

  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
    );
    fromHome = Get.arguments['fromHome'];
    index = Get.arguments['index'];
    pvId = Get.arguments['pvId'];
    if (fromHome) {
      roomModel = Get.arguments['roomModel'];
    } else {
      userModel = Get.arguments['userModel'];
    }

    getMessages();

    super.onInit();
  }

  getMessages() async {
    request
        .getMessages(
          pvId: pvId,
          limit: limitMessage,
          offset: offsetMessage,
        )
        .then((value) {});
  }

  void switchToSearch() {
    isSearchClicked(true);
  }

  void cancelSearch() {
    searchTextController.clear();
    isSearchClicked(false);
  }

  void goToSingleProfile() {
    Get.toNamed(NameRouts.singleProfile, arguments: {
      'profile': roomModel,
    });
  }

  void sendMessage() async {
    animationController
      ..duration = const Duration(milliseconds: 1800)
      ..forward();
    Future.delayed(const Duration(milliseconds: 1800), () {
      animationController.reset();
    });

    getMessages();
  }
}

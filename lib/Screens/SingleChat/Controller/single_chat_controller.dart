import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../MainModel/chat_model.dart';

class SingleChatController extends GetxController{




  late final ChatModel model;
  int index = 0;

  RxBool isSearchClicked = false.obs;

  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {

    model = Get.arguments['item'];
    index = Get.arguments['index'];


    super.onInit();
  }

  void switchToSearch() {
    isSearchClicked(true);
  }

  void cancelSearch() {
    searchTextController.clear();
    isSearchClicked(false);
  }
}
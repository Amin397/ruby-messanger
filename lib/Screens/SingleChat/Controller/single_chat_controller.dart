import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../MainModel/chat_model.dart';

class SingleChatController extends GetxController {
  late final ChatModel model;
  int index = 0;

  RxBool isSearchClicked = false.obs;

  TextEditingController searchTextController = TextEditingController();
  TextEditingController messageTextController = TextEditingController();

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

  void showMoreOptions() async {
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.2),
      transitionDuration: const Duration(milliseconds: 200),
      context: Get.context!,
      pageBuilder: (context, anim1, anim2) => Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Amin'),
              Text('Amin'),
              Text('Amin'),
            ],
          ),
        ),
      ),
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(1, -1),
            end: const Offset(.5, -.5),
          ).animate(anim1),
          child: child,
        );
      },
    );
  }
}

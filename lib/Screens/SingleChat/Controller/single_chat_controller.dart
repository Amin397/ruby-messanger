import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/MainModel/GetRouts.dart';
import 'package:rubymessanger/Utils/project_request_utils.dart';
import 'package:rubymessanger/Utils/view_utils.dart';
import 'package:rubymessanger/main.dart';

import '../../../MainModel/chat_model.dart';
import '../../../MainModel/user_model.dart';
import '../Model/message_model.dart';

class SingleChatController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final AnimationController animationController;
  ProjectRequestUtils request = ProjectRequestUtils();

  List<MessageModel> listOfMessages = [];
  late ScrollController scrollController;

  RoomModel? roomModel;
  UserModel? userModel;
  int index = 0;
  int pvId = 0;

  RxBool isSearchClicked = false.obs;
  RxBool isMessagesLoaded = false.obs;
  bool fromHome = false;

  TextEditingController searchTextController = TextEditingController();
  TextEditingController messageTextController = TextEditingController();

  bool hasNext = false;
  int limitMessage = 15;
  int offsetMessage = 0;

  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
    );

    scrollController = ScrollController(initialScrollOffset: 0.0);

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
    Map<String, dynamic> mapResult;
    request
        .getMessages(
      pvId: pvId,
      limit: limitMessage,
      offset: offsetMessage,
    )
        .then((value) {
      mapResult = jsonDecode(value.body);
      switch (value.statusCode) {
        case 200:
          {
            hasNext = mapResult['has_next'];

            listOfMessages =
                MessageModel.listFromJson(jsonDecode(value.body)['result']);
            // scrollController.animateTo(
            //   scrollController.offset + listOfMessages.length,
            //   curve: Curves.linear,
            //   duration: const Duration(milliseconds: 500),
            // );
            break;
          }
        case 600:
          {
            ViewUtils.showError(
              errorMessage: value.body,
            );
            break;
          }
        case 406:
          {
            ViewUtils.showError(
              errorMessage: jsonDecode(value.body)['detail'],
            );
            break;
          }
        case 700:
          {
            ViewUtils.showError(
              errorMessage: value.body,
            );
            break;
          }
        default:
          {
            ViewUtils.showError(
              errorMessage: 'Something went wrong',
            );
            break;
          }
      }
      isMessagesLoaded(true);
    });
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

    print('==============');
    request
        .sendMessage(
      pvId: pvId,
      messageText: messageTextController.text,
    )
        .then((value) {
      switch (value.statusCode) {
        case 201:
          {
            break;
          }
        case 600:
          {
            ViewUtils.showError(
              errorMessage: value.body,
            );
            break;
          }
        case 406:
          {
            ViewUtils.showError(
              errorMessage: jsonDecode(value.body)['detail'],
            );
            break;
          }
        case 700:
          {
            ViewUtils.showError(
              errorMessage: value.body,
            );
            break;
          }
        default:
          {
            ViewUtils.showError(
              errorMessage: 'Something went wrong',
            );
            break;
          }
      }
    });
  }


  void unFocus() {
    Focus.of(Get.context!).requestFocus(FocusNode());
  }


  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

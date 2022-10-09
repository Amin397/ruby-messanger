import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Bloc/blocs.dart';
import 'package:rubymessanger/MainModel/GetRouts.dart';
import 'package:rubymessanger/MainModel/socket_message_model.dart';
import 'package:rubymessanger/Screens/Home/Model/chat_room_model.dart';
import 'package:rubymessanger/Utils/project_request_utils.dart';
import 'package:rubymessanger/Utils/view_utils.dart';
import 'package:web_socket_channel/io.dart';

import '../../../MainModel/user_model.dart';
import '../../../main.dart';
import '../Model/message_model.dart';

class SingleChatController extends GetxController
    with GetTickerProviderStateMixin {
  late final AnimationController animationController;
  ProjectRequestUtils request = ProjectRequestUtils();

  List<MessageModel> listOfMessages = [];
  late ScrollController scrollController;

  ChatRoomModel? roomModel;
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

  late final IOWebSocketChannel channel;
  late SocketMessageModel socketModel;

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

    connectToSocket();
    getMessages();

    super.onInit();
  }

//  09163005882
//
//  کبودوند

  connectToSocket() async {
    try {
      channel = IOWebSocketChannel.connect(
          'ws://${baseUrl.replaceAll('http://', '')}/ws/?token=${Blocs.user.accessToken}');

      channel.stream.listen((event) {
        socketModel = SocketMessageModel.fromJson(jsonDecode(event));
        if (Blocs.user.user!.id != socketModel.userId) {
          if (!listOfMessages.any((element) => element.id == socketModel.id)) {
            listOfMessages.add(
              MessageModel(
                isMe: false,
                id: socketModel.id,
                isSend: true.obs,
                text: socketModel.text,
                pvId: socketModel.pvId,
                userId: socketModel.userId,
                dateAdded: socketModel.dateAdded,
                dateUpdated: socketModel.dateUpdated,
                isUnread: socketModel.isUnread,
                image: socketModel.image,
                replyId: socketModel.replyId,
              ),
            );
            update(['chatList']);
            Future.delayed(const Duration(milliseconds: 200), () {
              scrollController.animateTo(
                scrollController.position.maxScrollExtent + 70,
                duration: const Duration(
                  milliseconds: 300,
                ),
                curve: Curves.easeInOut,
              );
            });
          }
        }
      });
    } catch (e) {
      print(e);
    }
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
            if (listOfMessages.isNotEmpty) {
              Future.delayed(const Duration(milliseconds: 200), () {
                scrollController.animateTo(
                  scrollController.position.maxScrollExtent + 70,
                  duration: const Duration(
                    milliseconds: 600,
                  ),
                  curve: Curves.easeInOut,
                );
              });
            }
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
    // Get.toNamed(NameRouts.singleProfile, arguments: {
    //   'profile': roomModel,
    // });

    // print(userModel);

    if (fromHome) {
      // Get.toNamed(NameRouts.contactProfile, arguments: {
      //   'userId': roomModel.,
      //   'profilePicture': userModel!.profilePicture,
      //   'userName': '${userModel!.firstName} ${userModel!.lastName}',
      //   'index': index
      // });
    } else {
      Get.back();
    }
  }

  void sendMessage() async {
    String text = messageTextController.text;
    messageTextController.clear();
    MessageModel message = MessageModel(
      isMe: true,
      isSend: false.obs,
      text: text,
      userId: Blocs.user.user!.id,
      dateAdded: DateTime.now(),
      isUnread: false,
      pvId: pvId,
    );

    if (listOfMessages.isNotEmpty) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent + 100,
        duration: const Duration(
          milliseconds: 600,
        ),
        curve: Curves.easeInOut,
      );
    }

    animationController
      ..duration = const Duration(milliseconds: 1800)
      ..forward();
    Future.delayed(const Duration(milliseconds: 1800), () {
      animationController.reset();
    });
    listOfMessages.add(message);
    update(['chatList']);
    update(['chatList']);
    request
        .sendMessage(
      pvId: pvId,
      messageText: text,
    )
        .then((value) {
      switch (value.statusCode) {
        case 201:
          {
            message.isSend(true);
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

  @override
  void onClose() {
    channel.sink.close();
    print('socket closed');
    super.onClose();
  }

  void scrollToDown() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 70,
      duration: const Duration(
        milliseconds: 600,
      ),
      curve: Curves.easeInOut,
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Bloc/blocs.dart';
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

  MessageModel? message;

  RxBool isSearchClicked = false.obs;
  RxBool isMessageClicked = false.obs;
  RxBool isMessagesLoaded = false.obs;
  bool fromHome = false;

  TextEditingController searchTextController = TextEditingController();
  TextEditingController messageTextController = TextEditingController();

  bool hasNext = false;
  int limitMessage = 30;
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
        print(event);
        if (Blocs.user.user!.id != socketModel.userId) {
          if (!listOfMessages.any((element) => element.id == socketModel.id)) {
            listOfMessages.add(
              MessageModel(
                isMe: false,
                id: socketModel.id,
                isSelected: false.obs,
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
        } else {
          message!.isSend(true);
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
              listOfMessages.forEach((element) {
                element.controller = AnimationController(
                  vsync: this,
                  duration: const Duration(milliseconds: 500),
                  reverseDuration: const Duration(milliseconds: 500),
                );
              });

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
    message = MessageModel(
      isMe: true,
      id: (listOfMessages.isNotEmpty) ? listOfMessages.last.id! + 1 : 1,
      isSend: false.obs,
      text: text,
      isSelected: false.obs,
      userId: Blocs.user.user!.id,
      dateAdded: DateTime.now(),
      isUnread: false,
      pvId: pvId,
      controller: AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
        reverseDuration: const Duration(milliseconds: 500),
      ),
    );
    print(message!.id);

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
    listOfMessages.add(message!);
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
            // message!.isSend(true);
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

  void selectMessage({required MessageModel message}) {
    isMessageClicked(true);
    if (isMessageClicked.isTrue) {
      message.controller!
        ..duration
        ..forward();
      message.isSelected(true);
    }
  }

  void selectSingleMessage({required MessageModel message}) {
    if (message.isSelected.isTrue) {
      if (listOfMessages.where((element) => element.isSelected.isTrue).length ==
          1) {
        message.controller!
          ..duration
          ..reverse();
        message.isSelected(false);
        isMessageClicked(false);
      } else {
        message.controller!
          ..duration
          ..reverse();
        message.isSelected(false);
      }
    } else {
      message.controller!
        ..duration
        ..forward();
      message.isSelected(true);
    }
  }

  void closeMessageClicked() {
    for (var element in listOfMessages) {
      element.isSelected(false);
      element.controller!
        ..duration
        ..reverse();
    }

    isMessageClicked(false);
  }

  void deleteMessage() async {
    List<String> messageIds = [];

    for (var element in listOfMessages) {
      if (element.isSelected.isTrue) {
        messageIds.add(element.id.toString());
      }
    }
    request
        .deleteMessages(pvId: pvId.toString(), messagesId: messageIds)
        .then((value) {
      print(value.statusCode);
      switch (value.statusCode) {
        case 204:
          {

            // message!.isSend(true);

            for (var element1 in messageIds) {
              listOfMessages
                  .removeWhere((element) => element.id == int.parse(element1));
            }

            update(['chatList']);
            isMessageClicked(false);

            messageIds.clear();
            break;
          }
        case 600:
          {
            ViewUtils.showError(
              errorMessage: value.data,
            );
            break;
          }
        case 406:
          {
            ViewUtils.showError(
              errorMessage: jsonDecode(value.data)['detail'],
            );
            break;
          }
        case 700:
          {
            ViewUtils.showError(
              errorMessage: value.data,
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

    // if(listOfMessages.where((element) => element.isSelected.isTrue).length > 1){
    //
    // }else{
    //
    // }
  }
}

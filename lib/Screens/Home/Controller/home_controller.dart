import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Bloc/blocs.dart';
import 'package:rubymessanger/MainModel/GetRouts.dart';
import 'package:rubymessanger/main.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../Utils/project_request_utils.dart';
import '../../../Utils/view_utils.dart';
import '../Model/chat_room_model.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

  late final WebSocketChannel? channel;
  ProjectRequestUtils request = ProjectRequestUtils();

  List<ChatRoomModel> chatRoomList = [];

  late AnimationController animatedIconController;
  late AnimationController animatedIconController1;
  RxBool isCollapsed = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isNewChat = false.obs;

  RxBool isDark = false.obs;
  RxBool scrollTop = true.obs;

  late ScrollController scrollController;

  bool hasNext = false;

  @override
  void onInit() {
    // getPermission();
    getRooms();
    super.onInit();

    scrollController = ScrollController(initialScrollOffset: 0.0);

    if (Get.isDarkMode) {
      isDark(true);
    }
    animatedIconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 300),
    );
    animatedIconController1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 300),
    );

    channel = WebSocketChannel.connect(
      Uri.parse(
          'ws://${baseUrl.replaceAll('http://', '')}ws/?token=${Blocs.user.accessToken}'),
    );
  }

  getRooms() async {
    request.getChatRooms().then((value) {
      switch (value.statusCode) {
        case 200:
          {
            hasNext = jsonDecode(value.body)['has_next'];
            chatRoomList =
                ChatRoomModel.listFromJson(jsonDecode(value.body)['result']);
            isLoaded(true);
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

  // getPermission()async{
  //   // await FlutterContacts.requestPermission();
  // }

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

  void newChat() async {
    if (isNewChat.isTrue) {
      animatedIconController1.reverse();
      isNewChat(false);
    } else {
      animatedIconController1.forward();
      isNewChat(true);
    }
    update(['newChat']);
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

  void selectChat({required ChatRoomModel item}) {
    item.isSelected!(true);
  }

  void tapOnChat({
    required ChatRoomModel item,
    required int index,
  }) {
    if (chatRoomList.any((element) => element.isSelected!.isTrue)) {
      item.isSelected!(!item.isSelected!.value);
    } else {
      Get.toNamed(NameRouts.singleChat, arguments: {
        'index': index,
        'roomModel': item,
        'fromHome': true,
        'pvId': item.roomId,
      });
    }
  }

  @override
  void dispose() {
    channel!.sink.close();
    super.dispose();
  }

  void scrollList(ScrollUpdateNotification t) {
    if (t.scrollDelta! < 0) {
      scrollTop(true);
    } else {
      scrollTop(false);
    }
    // print(t.scrollDelta);
  }
}

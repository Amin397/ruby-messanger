import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Bloc/blocs.dart';
import 'package:rubymessanger/MainModel/GetRouts.dart';
import 'package:rubymessanger/MainModel/chat_model.dart';
import 'package:rubymessanger/main.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

  late final WebSocketChannel? channel;

  late AnimationController animatedIconController;
  late AnimationController animatedIconController1;
  RxBool isCollapsed = false.obs;
  RxBool isNewChat = false.obs;

  RxBool isDark = false.obs;
  RxBool scrollTop = true.obs;

  List<ChatModel> listOfChats = [
    ChatModel(
      fromMe: true,
      gender: true,
      delivered: true,
      unreadMessage: 0.obs,
      title: 'Amin Khademi',
      image: 'assets/images/image.jpg',
      lastMessage: 'goftam bia inja',
      seen: true,
      isSelected: true.obs,
    ),
    ChatModel(
      fromMe: true,
      gender: false,
      delivered: true,
      unreadMessage: 0.obs,
      title: 'Amin Khademi',
      image: 'assets/images/image.jpg',
      lastMessage: 'goftam bia inja',
      seen: true,
      isSelected: true.obs,
    ),
    ChatModel(
      fromMe: true,
      gender: false,
      delivered: true,
      unreadMessage: 0.obs,
      title: 'Amin Khademi',
      image: 'assets/images/image.jpg',
      lastMessage: 'goftam bia inja',
      seen: true,
      isSelected: true.obs,
    ),
    ChatModel(
      fromMe: true,
      gender: true,
      delivered: true,
      unreadMessage: 0.obs,
      title: 'Amin Khademi',
      image: 'assets/images/image.jpg',
      lastMessage: 'goftam bia inja',
      seen: true,
      isSelected: true.obs,
    ),
    ChatModel(
      fromMe: true,
      gender: true,
      delivered: true,
      unreadMessage: 0.obs,
      title: 'Amin Khademi',
      image: 'assets/images/image.jpg',
      lastMessage: 'goftam bia inja',
      seen: true,
      isSelected: true.obs,
    ),
    ChatModel(
      fromMe: true,
      gender: true,
      delivered: true,
      unreadMessage: 0.obs,
      title: 'Amin Khademi',
      image: 'assets/images/image.jpg',
      lastMessage: 'goftam bia inja',
      seen: true,
      isSelected: true.obs,
    ),
    ChatModel(
      fromMe: true,
      gender: true,
      delivered: true,
      unreadMessage: 0.obs,
      title: 'Amin Khademi',
      image: 'assets/images/image.jpg',
      lastMessage: 'goftam bia inja',
      seen: true,
      isSelected: true.obs,
    ),
    ChatModel(
      fromMe: true,
      gender: true,
      delivered: true,
      unreadMessage: 0.obs,
      title: 'Amin Khademi',
      image: 'assets/images/image.jpg',
      lastMessage: 'goftam bia inja',
      seen: true,
      isSelected: true.obs,
    ),
    ChatModel(
      fromMe: true,
      gender: true,
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
      gender: true,
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
      gender: false,
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
      gender: true,
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
      gender: true,
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
      gender: true,
      delivered: false,
      unreadMessage: 5.obs,
      title: 'Amin Khademi',
      image: 'assets/images/image.jpg',
      lastMessage: 'goftam bia inja',
      seen: true,
      isSelected: false.obs,
    ),
  ];

  late ScrollController scrollController;

  @override
  void onInit(){


    getPermission();
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

  getPermission()async{
    // await FlutterContacts.requestPermission();
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

  void selectChat({required ChatModel item}) {
    item.isSelected(true);
  }

  void tapOnChat({
    required ChatModel item,
    required int index,
  }) {
    if (listOfChats.any((element) => element.isSelected.isTrue)) {
      item.isSelected(!item.isSelected.value);
    } else {
      Get.toNamed(NameRouts.singleChat, arguments: {
        'index': index,
        'item': item,
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

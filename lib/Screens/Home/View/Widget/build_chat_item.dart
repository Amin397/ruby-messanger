import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/MainModel/chat_model.dart';
import 'package:rubymessanger/Screens/Home/Controller/home_controller.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

class BuildChatItem extends StatelessWidget {
  const BuildChatItem({
    Key? key,
    required this.controller,
    required this.index,
    required this.chat,
  }) : super(key: key);
  final HomeController controller;
  final int index;
  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InkWell(
        onLongPress: (){
          controller.selectChat(item:chat,);
        },
        onTap: (){
          controller.tapOnChat(item:chat);
        },
        child: SizedBox(
          width: Get.width,
          height: Get.height * .07,
          child: Row(
            children: [
              _buildBody(),
              SizedBox(
                width: Get.width * .035,
              ),
              _buildAvatar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    String name = '';
    List<String> nameAvatar = [];
    if (chat.title.contains(' ')) {
      nameAvatar = chat.title.split(' ');
    }

    for (var o in nameAvatar) {
      print(o.substring(0, 1));
      name = name + o.substring(0, 1).toUpperCase();
    }

    return Stack(
      children: [
        Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: Get.width * .13,
            height: Get.width * .13,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: (chat.isSelected.isTrue)
                      ? Colors.red.shade800
                      : ColorUtils.grey,
                  width: (chat.isSelected.isTrue) ? 2.5 : 1.0,
                ),
                color: Colors
                    .primaries[Random().nextInt(Colors.primaries.length)]
                    .withOpacity(.5)),
            child: (chat.image!.length > 5)
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image(
                      image: AssetImage(chat.image!),
                      fit: BoxFit.cover,
                    ),
                  )
                : Center(
                    child: AutoSizeText(
                      name,
                      maxFontSize: 18.0,
                      minFontSize: 10.0,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
          ),
        ),
        Obx(
          () => (chat.isSelected.isTrue)
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 20.0,
                    width: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.red.shade800,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 12.0,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        )
      ],
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Column(
                  children: [
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        child: (chat.fromMe)
                            ? (chat.delivered!)
                                ? Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Icon(
                                        Icons.check,
                                        color: Colors.red.shade800,
                                        size: 16.0,
                                      ),
                                      Positioned(
                                        right: 5.0,
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.red.shade800,
                                          size: 16.0,
                                        ),
                                      ),
                                    ],
                                  )
                                : const Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.check,
                                      size: 16.0,
                                      color: Colors.grey,
                                    ),
                                  )
                            : const AutoSizeText(
                                'Wed',
                                maxFontSize: 16.0,
                                minFontSize: 10.0,
                                maxLines: 1,
                                style: TextStyle(
                                  color: ColorUtils.grey,
                                  fontSize: 12.0,
                                ),
                              ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        child: (chat.unreadMessage > 0)
                            ? Container(
                                margin: paddingAll4,
                                decoration: BoxDecoration(
                                  color: Colors.red.shade800,
                                  borderRadius: radiusAll8,
                                  boxShadow: ViewUtils.shadow(),
                                ),
                                child: Center(
                                  child: AutoSizeText(
                                    chat.unreadMessage.toString(),
                                    maxLines: 1,
                                    maxFontSize: 14.0,
                                    minFontSize: 10.0,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 6,
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Column(
                  children: [
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            chat.title,
                            maxLines: 1,
                            maxFontSize: 18.0,
                            minFontSize: 12.0,
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            chat.lastMessage!,
                            maxLines: 2,
                            maxFontSize: 14.0,
                            minFontSize: 10.0,
                            style: const TextStyle(
                              color: ColorUtils.grey,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

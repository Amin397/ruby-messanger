import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Screens/Home/Controller/home_controller.dart';
import 'package:rubymessanger/Screens/Home/Model/chat_room_model.dart';

class BuildChatItem extends StatelessWidget {
  const BuildChatItem({
    Key? key,
    required this.controller,
    required this.index,
    required this.chat,
  }) : super(key: key);
  final HomeController controller;
  final int index;
  final ChatRoomModel chat;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InkWell(
        onLongPress: () {
          controller.selectChat(
            item: chat,
          );
        },
        onTap: () {
          controller.tapOnChat(
            item: chat,
            index: index,
          );
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
                color: (chat.isSelected!.isTrue)
                    ? ColorUtils.mainColor
                    : Colors.grey,
                width: (chat.isSelected!.isTrue) ? 2.5 : 1.0,
              ),
            ),
            child: Hero(
              tag: 'chatProfile-$index',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: (chat.avatar is String)
                    ? Image(
                        image: NetworkImage(
                          chat.avatar!,
                        ),
                        fit: BoxFit.cover,
                      )
                    : const Image(
                        image: AssetImage(
                            // (chat.gender!)
                            'assets/images/male_image.png'
                            // : 'assets/images/female_image.png',
                            ),
                      ),
              ),
            ),
          ),
        ),
        Obx(
          () => (chat.isSelected!.isTrue)
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
                        // child: (chat.isLastFromMe!)
                        //     ? (chat!.delivered!)
                        //         ? Stack(
                        //             clipBehavior: Clip.none,
                        //             children: [
                        //               Icon(
                        //                 Icons.check,
                        //                 color: Colors.red.shade800,
                        //                 size: 16.0,
                        //               ),
                        //               Positioned(
                        //                 right: 5.0,
                        //                 child: Icon(
                        //                   Icons.check,
                        //                   color: Colors.red.shade800,
                        //                   size: 16.0,
                        //                 ),
                        //               ),
                        //             ],
                        //           )
                        //         : const Align(
                        //             alignment: Alignment.centerRight,
                        //             child: Icon(
                        //               Icons.check,
                        //               size: 16.0,
                        //               color: Colors.grey,
                        //             ),
                        //           )
                        //     : const AutoSizeText(
                        //         'Wed',
                        //         maxFontSize: 16.0,
                        //         minFontSize: 10.0,
                        //         maxLines: 1,
                        //         style: TextStyle(
                        //           color: ColorUtils.textColor,
                        //           fontSize: 12.0,
                        //         ),
                        //       ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        // child: (chat.unreadMessage > 0)
                        //     ? Container(
                        //         margin: paddingAll4,
                        //         decoration: BoxDecoration(
                        //           color: Colors.red.shade800,
                        //           borderRadius: radiusAll8,
                        //           boxShadow: ViewUtils.shadow(
                        //             offset: const Offset(
                        //               0.0,
                        //               -2.0,
                        //             ),
                        //           ),
                        //         ),
                        //         child: Center(
                        //           child: AutoSizeText(
                        //             chat.unreadMessage.toString(),
                        //             maxLines: 1,
                        //             maxFontSize: 14.0,
                        //             minFontSize: 10.0,
                        //             style: const TextStyle(
                        //               color: Colors.white,
                        //               fontSize: 12.0,
                        //             ),
                        //           ),
                        //         ),
                        //       )
                        //     : const SizedBox(),
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
                            chat.name!,
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
                              color: ColorUtils.textColor,
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

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/Home/Controller/home_controller.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

import '../../../../Utils/widget_utils.dart';
import 'build_chat_item.dart';

class HomeFrontWidget extends StatelessWidget {
  const HomeFrontWidget({Key? key, required this.controller}) : super(key: key);
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          if (controller.chatRoomList
              .any((element) => element.isSelected!.isTrue)) {
            for (var element in controller.chatRoomList) {
              element.isSelected!(false);
            }
          } else if (controller.isCollapsed.isTrue) {
            controller.openMenu();
          }
          return false;
        },
        child: Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedContainer(
            padding: paddingAll8,
            duration: const Duration(milliseconds: 350),
            width: Get.width,
            height: controller.isCollapsed.isTrue
                ? Get.height * .6
                : Get.height * .9,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: ViewUtils.shadow(
                offset: const Offset(
                  0.0,
                  -3.0,
                ),
              ),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12.0),
              ),
            ),
            child: Obx(
              () => (controller.isLoaded.isTrue)
                  ? (controller.chatRoomList.isNotEmpty)
                      ? AnimationLimiter(
                          child: NotificationListener(
                            child: ListView.separated(
                              separatorBuilder:
                                  (BuildContext context, int index) => Divider(
                                color: Colors.grey[200],
                              ),
                              controller: controller.scrollController,
                              itemCount: controller.chatRoomList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 500),
                                  child: ScaleAnimation(
                                    child: BuildChatItem(
                                      controller: controller,
                                      chat: controller.chatRoomList[index],
                                      index: index,
                                    ),
                                  ),
                                );
                              },
                            ),
                            onNotification: (ScrollUpdateNotification t) {
                              controller.scrollList(t);
                              return true;
                            },
                          ),
                        )
                      : WidgetUtils.emptyData(
                          text: 'no conversation',
                        )
                  : ViewUtils.loadingAnimation(),
            ),
          ),
        ),
      ),
    );
  }
}

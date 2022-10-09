
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Bloc/blocs.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/SingleChat/Controller/single_chat_controller.dart';
import 'package:rubymessanger/Utils/view_utils.dart';
import 'package:rubymessanger/Utils/widget_utils.dart';

import 'build_message_item_widget.dart';

class BuildChatBodyWidget extends StatelessWidget {
  const BuildChatBodyWidget({Key? key, required this.controller})
      : super(key: key);

  final SingleChatController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => Container(
          margin: paddingAll8,
          height: double.maxFinite,
          width: double.maxFinite,
          child: (controller.isMessagesLoaded.isTrue)
              ? (controller.listOfMessages.isEmpty)
                  ? WidgetUtils.emptyData(
                      text: 'no conversation',
                    )
                  : _buildListOfMessage()
              : ViewUtils.loadingAnimation(),
        ),
      ),
    );
  }

  Widget _buildListOfMessage() {
    return GetBuilder(
      id: 'chatList',
      init: controller,
      builder: (ctx)=>AnimationLimiter(
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => const Divider(
            color: Colors.transparent,
          ),
          controller: controller.scrollController,
          itemCount: controller.listOfMessages.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 500),
              child: ScaleAnimation(
                child: BuildMessageItemWidget(
                  controller: controller,
                  message: controller.listOfMessages[index],
                  index: index,
                  // isMe: controller.listOfMessages[index].userId == Blocs.user.user.id,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

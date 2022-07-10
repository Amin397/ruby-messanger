import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/NewChat/Controller/new_chat_controller.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

import 'build_contact_item_widget.dart';

class BuildNewChatContactListWidget extends StatelessWidget {
  const BuildNewChatContactListWidget({Key? key, required this.controller})
      : super(key: key);

  final NewChatController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: paddingAll8,
        child: Obx(() => (controller.isLoaded.isTrue)
            ? AnimationLimiter(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    height: Get.height * .01,
                    color: Colors.grey[200],
                  ),
                  controller: controller.scrollController,
                  itemCount: controller.showContact.length,
                  // physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) =>
                      AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    child: ScaleAnimation(
                      child: BuildContactItemWidget(
                        controller: controller,
                        contact: controller.showContact[index],
                        index: index,
                      ),
                    ),
                  ),
                ),
              )
            : ViewUtils.loadingAnimation()),
      ),
    );
  }
}

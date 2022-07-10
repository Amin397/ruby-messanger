
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Bloc/blocs.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Screens/Home/Controller/home_controller.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

class BuildFloatingCreateNewChatButtonWidget extends StatelessWidget {
  const BuildFloatingCreateNewChatButtonWidget(
      {Key? key, required this.controller})
      : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        right: 12.0,
        bottom: (controller.scrollTop.isTrue) ? 10.0 : -100,
        duration: const Duration(milliseconds: 220),
        child: _buildNewChatButton(),
      ),
    );
  }

  Widget _buildNewChatButton() {
    return GestureDetector(
      onTap: () {
        controller.newChat();
        // log(Blocs.user.accessToken);
      },
      child: Container(
        height: Get.width * .155,
        width: Get.width * .155,
        decoration: BoxDecoration(
          color: ColorUtils.mainColor,
          shape: BoxShape.circle,
          boxShadow: ViewUtils.shadow(),
        ),
        child: Center(
          child: GetBuilder(
            id: 'newChat',
            init: controller,
            builder: (ctx) => AnimatedIcon(
              size: 26,
              color: Colors.white,
              icon: AnimatedIcons.add_event,
              progress: controller.animatedIconController1,
            ),
          ),
        ),
      ),
    );
  }
}

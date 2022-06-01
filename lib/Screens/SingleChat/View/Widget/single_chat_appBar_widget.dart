import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/SingleChat/Controller/single_chat_controller.dart';
import 'package:rubymessanger/Screens/SingleChat/View/Widget/build_normal_appbar_widget.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

import 'build_search_bar_widget.dart';

class SingleChatAppBarWidget extends StatelessWidget {
  const SingleChatAppBarWidget({Key? key, required this.controller})
      : super(key: key);
  final SingleChatController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * .1,
      decoration: BoxDecoration(
        color:
            (Get.isDarkMode) ? Colors.blueGrey.shade800 : Colors.red.shade800,
        boxShadow: (Get.isDarkMode)
            ? [
                const BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                )
              ]
            : ViewUtils.shadow(
                offset: const Offset(
                  0.0,
                  3.0,
                ),
              ),
      ),
      child: Column(
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height * .03,
          ),
          _buildAppBarBody(),
        ],
      ),
    );
  }

  Widget _buildAppBarBody() {
    return Obx(
      () => AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (widget, animation) => FadeTransition(
          opacity: animation,
          child: widget,
        ),
        child: (controller.isSearchClicked.isTrue)
            ? BuildSearchBarWidget(
                controller: controller,
              )
            : BuildNormalAppbarWidget(
                controller: controller,
              ),
      ),
    );
  }

}

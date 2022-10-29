import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/SingleChat/Controller/single_chat_controller.dart';
import 'package:rubymessanger/Screens/SingleChat/View/Widget/build_normal_appbar_widget.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

import 'build_message_clicked_app_bar_widget.dart';
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
            (Get.isDarkMode) ? ColorUtils.mainDarkColor : ColorUtils.mainColor,
        boxShadow: ViewUtils.shadow(),
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

    return Obx((){
      if(controller.isMessageClicked.isTrue){
        return BuildMessageClickedAppBarWidget(
          controller:controller,
        );
      }else if(controller.isSearchClicked.isTrue){
        return BuildSearchBarWidget(
          controller: controller,
        );
      }else{
        return BuildNormalAppbarWidget(
          controller: controller,
        );
      }
    });
    // return Obx(
    //   () => AnimatedSwitcher(
    //     duration: const Duration(milliseconds: 200),
    //     transitionBuilder: (widget, animation) => FadeTransition(
    //       opacity: animation,
    //       child: widget,
    //     ),
    //     child: (controller.isSearchClicked.isTrue)
    //         ? BuildSearchBarWidget(
    //             controller: controller,
    //           )
    //         : BuildNormalAppbarWidget(
    //             controller: controller,
    //           ),
    //   ),
    // );
  }
}

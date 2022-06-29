import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/EditProfile/Controller/edit_profile_controller.dart';
import 'package:rubymessanger/Screens/EditProfile/View/edit_profile_screen.dart';
import 'package:rubymessanger/Utils/view_utils.dart';
import 'package:rubymessanger/Utils/widget_utils.dart';

import '../../../SingleChat/View/Widget/build_normal_appbar_widget.dart';

class BuildEditProfileAppBarWidget extends StatelessWidget {
  const BuildEditProfileAppBarWidget({Key? key, required this.controller})
      : super(key: key);

  final EditProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .1,
      width: Get.width,
      decoration: BoxDecoration(
        color:
            (Get.isDarkMode) ? ColorUtils.mainDarkColor : ColorUtils.mainColor,
        boxShadow: ViewUtils.shadow(),
      ),
      // padding: paddingAll8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          PopupMenuButton<int>(
            offset: const Offset(0, 50),
            shape: const TooltipShape(),
            onSelected: (item) {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                onTap: () {
                  print('num 1');
                },
                value: 1,
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: (Get.isDarkMode) ? Colors.white30 : Colors.grey,
                    ),
                    SizedBox(
                      width: Get.width * .03,
                    ),
                    const Text('Edit name')
                  ],
                ),
              ),
              PopupMenuItem<int>(
                onTap: () {

                },
                value: 1,
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: (Get.isDarkMode) ? Colors.white30 : Colors.grey,
                    ),
                    SizedBox(
                      width: Get.width * .03,
                    ),
                    const Text('Log Out',)
                  ],
                ),
              ),
            ],
          ),
          WidgetUtils.backButton(),
        ],
      ),
    );
  }
}

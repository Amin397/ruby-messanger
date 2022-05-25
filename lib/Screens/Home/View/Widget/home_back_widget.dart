import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import '../../Controller/home_controller.dart';

class HomeBackWidget extends StatelessWidget {
  const HomeBackWidget({Key? key, required this.controller}) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            _buildAppBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      width: Get.width,
      height: Get.height * .09,
      padding: paddingAll8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              controller.changeTheme();
            },
            child: const Icon(Icons.ac_unit),
          ),
          const AutoSizeText(
            'Ruby',
            style: TextStyle(
              fontFamily: 'ruby',
              fontSize: 20.0,
              letterSpacing: 4.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.openMenu();
            },
            child: GetBuilder(
              id: 'menu',
              init: controller,
              builder: (ctx) => AnimatedIcon(
                size: 26,
                icon: AnimatedIcons.menu_close,
                progress: controller.animatedIconController,
              ),
            ),
          )
        ],
      ),
    );
  }
}

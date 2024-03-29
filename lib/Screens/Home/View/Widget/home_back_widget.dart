import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import '../../Controller/home_controller.dart';
import 'build_app_bar_widget.dart';
import 'build_profile_part.dart';

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
            BuildAppbarWidget(
              controller: controller,
            ),
            Expanded(
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                padding: paddingAll6,
                child: Column(
                  children: [
                    BuildProfilePart(
                      controller: controller,
                    ),
                    const Divider(),
                    _buildMenuItem(
                      icon: const Icon(
                        Icons.settings,
                      ),
                      text: 'Setting',
                      textColor: ColorUtils.textColor,
                      func: (){

                      },
                    ),
                    _buildMenuItem(
                      icon: const Icon(
                        Icons.info,
                      ),
                      text: 'Info',
                      textColor: ColorUtils.textColor,
                      func: (){

                      },
                    ),
                    // Spacer(),
                    _buildMenuItem(
                      icon: Icon(
                        Icons.logout,
                        color: ColorUtils.mainColor,
                      ),
                      text: 'Log out',
                      textColor: ColorUtils.mainColor,
                      func: (){
                        controller.showExitAlert();
                      },
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

  Widget _buildMenuItem({
    required Widget icon,
    required String text,
    required Color textColor,
    required Function func,
  }) {
    return InkWell(
      onTap: (){
        func();
      },
      child: Container(
        margin: paddingSymmetricV2,
        width: Get.width,
        height: Get.width * .1,
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    text,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: textColor
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            icon
          ],
        ),
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Screens/Intro/Controller/intro_controller.dart';

class BuildIntroPageViewWidget extends StatelessWidget {
  const BuildIntroPageViewWidget({Key? key, required this.controller})
      : super(key: key);

  final IntroController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: PageView(
            onPageChanged: (index){
              controller.changePage(index:index,);
            },
            controller: controller.pageController,
            // physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildSafePage(),
              _buildFastPage(),
              _buildUserFriendlyPage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSafePage() {
    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/anims/safe.json'),
          SizedBox(
            width: Get.width,
            height: Get.height * .1,
            child: const Center(
              child: AutoSizeText(
                'Safe and Awesome',
                style: TextStyle(
                  color: ColorUtils.textColor,
                  fontSize: 20.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFastPage() {
    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/anims/fast.json'),
          SizedBox(
            width: Get.width,
            height: Get.height * .1,
            child: const Center(
              child: AutoSizeText(
                'Fast and Awesome',
                style: TextStyle(
                  color: ColorUtils.textColor,
                  fontSize: 20.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildUserFriendlyPage() {
    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/anims/user_friendly.json'),
          SizedBox(
            width: Get.width,
            height: Get.height * .1,
            child: const Center(
              child: AutoSizeText(
                'User Friendly and Awesome',
                style: TextStyle(
                  color: ColorUtils.textColor,
                  fontSize: 20.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

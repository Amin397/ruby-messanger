import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/Intro/Controller/intro_controller.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

class BuildIndicatorAndButtonsWidget extends StatelessWidget {
  const BuildIndicatorAndButtonsWidget({Key? key, required this.controller})
      : super(key: key);
  final IntroController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height * .1,
      child: Row(
        children: [
          _buildNextPart(),
          Flexible(
            flex: 3,
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildIndicatorDotes(
                    index: 2,
                  ),
                  _buildIndicatorDotes(
                    index: 1,
                  ),
                  _buildIndicatorDotes(
                    index: 0,
                  ),
                ],
              ),
            ),
          ),
          _buildPreviousPart(),
        ],
      ),
    );
  }

  Widget _buildIndicatorDotes({required int index}) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 270),
        width: (controller.currentIndex.value == index) ? Get.width * .1 : 10.0,
        height: 10.0,
        margin: paddingSymmetricH4,
        decoration: BoxDecoration(
          boxShadow: ViewUtils.shadow(),
          borderRadius: radiusAll24,
          color: (controller.currentIndex.value == index)
              ? ColorUtils.mainColor
              : Colors.grey,
        ),
      ),
    );
  }

  Widget _buildPreviousPart() {
    return Flexible(
      flex: 1,
      child: Obx(
        () => SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: (controller.currentIndex.value == 0)
              ? TextButton(
                  onPressed: () {
                    controller.goToRegisterScreen();
                  },
                  child: const AutoSizeText(
                    'skip',
                  ),
                )
              : IconButton(
                  onPressed: () {
                    controller.goToPrevious();
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey,
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildNextPart() {
    return Flexible(
      flex: 1,
      child: Obx(
        () => SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: (controller.currentIndex.value == 2)
              ? TextButton(
                  onPressed: () {


                    controller.goToRegisterScreen();


                  },
                  child: const AutoSizeText(
                    'Finish',
                  ),
                )
              : IconButton(
                  onPressed: () {
                    controller.goToNext();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.grey,
                  ),
                ),
        ),
      ),
    );
  }
}

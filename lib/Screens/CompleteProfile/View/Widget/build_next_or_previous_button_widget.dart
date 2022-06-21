import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/CompleteProfile/Controller/complete_profile_controller.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

class BuildNextOrPreviousButtonWidget extends StatelessWidget {
  const BuildNextOrPreviousButtonWidget({Key? key, required this.controller})
      : super(key: key);
  final CompleteProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (controller.currentIndex.value == 1)
          ? _buildSaveButton()
          : SizedBox(
              height: Get.height * .05,
              width: Get.width,
              child: Row(
                mainAxisAlignment: (controller.currentIndex.value == 0)
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.spaceBetween,
                children: [
                  _buildNext(),
                  (controller.currentIndex.value != 0)
                      ? _buildPrevious()
                      : const SizedBox(),
                ],
              ),
            ),
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: Get.width,
      height: Get.height * .05,
      child: Row(
        children: [
          Flexible(
            flex: 6,
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: ColorUtils.mainColor,
                borderRadius: radiusAll6,
                boxShadow: ViewUtils.shadow(),
              ),
              child: const Center(
                child: AutoSizeText(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: Get.width * .03,
          ),
          Flexible(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                controller.goToPrevious();
              },
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: ColorUtils.mainDarkColor,
                  borderRadius: radiusAll6,
                  boxShadow: ViewUtils.shadow(),
                ),
                child: const Center(
                  child: AutoSizeText(
                    'Previous',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNext() {
    return TextButton(
      onPressed: () {
        controller.goToNext();
      },
      child: const Text(
        'Next',
        style: TextStyle(
          color: ColorUtils.textColor,
        ),
      ),
    );
  }

  Widget _buildPrevious() {
    return TextButton(
      onPressed: () {
        controller.goToPrevious();
      },
      child: const Text(
        'Previous',
        style: TextStyle(
          color: ColorUtils.textColor,
        ),
      ),
    );
  }
}

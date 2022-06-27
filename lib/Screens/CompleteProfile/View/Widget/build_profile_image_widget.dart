import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/CompleteProfile/Controller/complete_profile_controller.dart';
import 'package:rubymessanger/Utils/view_utils.dart';
import 'build_camera_source_widget.dart';

class BuildCompleteRegisterImageWidget extends StatelessWidget {
  const BuildCompleteRegisterImageWidget({Key? key, required this.controller})
      : super(key: key);

  final CompleteProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      padding: paddingAll8,
      child: GetBuilder(
        init: controller,
        id: 'profileImage',
        builder: (ctx) => Column(
          children: [
            const Text(
              'Profile Image',
              style: TextStyle(
                color: ColorUtils.textColor,
              ),
            ),
            (controller.croppedFile != null)
                ? _buildShowImage()
                : _buildImagePlace(),
            SizedBox(
              height: Get.height * .05,
            ),
            Expanded(
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: BuildCameraSourceWidget(
                  controller: controller,
                ),
              ),
            ),
            (controller.croppedFile != null)
                ? const SizedBox()
                : SizedBox(
                    height: Get.height * .05,
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePlace() {
    return DottedBorder(
      borderType: BorderType.Circle,
      color: Colors.black54,
      strokeWidth: 1.0,
      radius: const Radius.circular(6),
      child: SizedBox(
        height: Get.width * .9,
        width: Get.width * .9,
        child: Center(
          child: ClipRRect(
            borderRadius: radiusAll6,
            child: Lottie.asset(
              'assets/anims/avatars.json',
              height: Get.height * .3,
              width: Get.height * .3,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShowImage() {
    return Container(
        height: Get.width * .9,
        width: Get.width * .9,
        decoration: BoxDecoration(
          boxShadow: ViewUtils.shadow(),
          shape: BoxShape.circle,
        ),
        child: Obx(
          () => Stack(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200.0),
                  child: Image(
                    image: FileImage(
                      File(controller.croppedFile!.path),
                    ),
                  ),
                ),
              ),
              (controller.imageUploaded.isTrue)
                  ? const SizedBox()
                  : Container(
                      height: Get.width * .9,
                      width: Get.width * .9,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black54,
                      ),
                    ),
              (controller.imageUploaded.isTrue)
                  ? const SizedBox()
                  : Center(
                      child: CircularProgressIndicator(
                        color: ColorUtils.mainColor,
                      ),
                    )
            ],
          ),
        ));
  }
}

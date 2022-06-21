import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/CompleteProfile/Controller/complete_profile_controller.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

class BuildCameraSourceWidget extends StatelessWidget {
  const BuildCameraSourceWidget({Key? key, required this.controller})
      : super(key: key);

  final CompleteProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Row(
              children: [
                _buildImageItem(
                  animation: 'assets/anims/camera.json',
                  text: 'Open camera',
                  source: ImageSource.camera,
                ),
                SizedBox(
                  width: Get.width * .05,
                ),
                _buildImageItem(
                  animation: 'assets/anims/gallery.json',
                  text: 'Open gallery',
                  source: ImageSource.gallery,
                ),
              ],
            ),
          ),
        ),
        (controller.croppedFile != null)?_buildRemoveButton():const SizedBox()
      ],
    );
  }

  Widget _buildImageItem({
    required String animation,
    required String text,
    required ImageSource source,
  }) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          controller.getImage(
            imageSource: source,
          );
        },
        child: Container(
          margin: paddingAll8,
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.2),
            borderRadius: radiusAll12,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                animation,
                height: Get.width * .35,
                width: Get.width * .35,
              ),
              AutoSizeText(text)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRemoveButton() {
    return GestureDetector(
      onTap: (){
        controller.removeImage();
      },
      child: Container(
        width: Get.width,
        height: Get.height * .05,
        decoration: BoxDecoration(
          boxShadow: ViewUtils.shadow(),
          borderRadius: radiusAll8,
          color: ColorUtils.mainColor,
        ),
        child: const Center(
          child: AutoSizeText(
            'Remove image',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}

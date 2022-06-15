import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/CompleteProfile/Controller/complete_profile_controller.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

class BuildCompleteProfileImageWidget extends StatelessWidget {
  const BuildCompleteProfileImageWidget({Key? key, required this.controller})
      : super(key: key);

  final CompleteProfileController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      id: 'imageColor',
      builder: (ctx) => (controller.image is XFile)
          ? Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: Get.width * .4,
                width: Get.width * .4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: ViewUtils.shadow(
                    offset: const Offset(3.0, 3.0),
                  ),
                  gradient: LinearGradient(
                    colors: (controller.paletteGenerator is PaletteGenerator)
                        ? controller.paletteGenerator!.colors.toList()
                        : [
                            Colors.white,
                          ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        margin: paddingAll6,
                        height: double.maxFinite,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 5.0,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: const Image(
                            image: AssetImage('assets/images/image.jpg'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Align(
              alignment: Alignment.centerLeft,
              child: DottedBorder(
                borderType: BorderType.RRect,
                color: Colors.black54,
                strokeWidth: 1.0,
                radius: const Radius.circular(100),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  child: SizedBox(
                    height: Get.width * .4,
                    width: Get.width * .4,
                    child: Stack(
                      children: [
                        Center(
                          child: Lottie.asset(
                            'assets/anims/camera.json',
                            height: Get.height * .6,
                            width: Get.height * .6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/MainModel/gender_model.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

import '../../Controller/complete_profile_controller.dart';

class BuildGenderSelectWidget extends StatelessWidget {
  const BuildGenderSelectWidget({Key? key, required this.controller})
      : super(key: key);

  final CompleteProfileController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height * .25,
      child: Row(
        children: [
          _buildGenderItem(
            genderModel: controller.genderList[0],
          ),
          _buildGenderItem(
            genderModel: controller.genderList[1],
          ),
        ],
      ),
    );
  }

  Widget _buildGenderItem({
    required GenderModel genderModel,
  }) {
    return Flexible(
      flex: 1,
      child: Obx(
        () => GestureDetector(
          onTap: () {
            controller.changeGender(
              gender: genderModel,
            );
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: double.maxFinite,
            width: double.maxFinite,
            margin: paddingAll8,
            decoration: BoxDecoration(
              color: (genderModel.id == 0)
                  ? (genderModel.isSelected.isTrue)
                      ? Colors.blue
                      : Colors.blue.withOpacity(.2)
                  : (genderModel.isSelected.isTrue)
                      ? Colors.pink
                      : Colors.pink.withOpacity(.2),
              borderRadius: radiusAll12,
              boxShadow: (genderModel.isSelected.isTrue)
                  ? ViewUtils.shadow()
                  : [
                      const BoxShadow(
                        color: Colors.white,
                      )
                    ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  genderModel.animation,
                  height: Get.width * .3,
                  width: Get.width * .3,
                ),
                AutoSizeText(
                  'I am ${genderModel.title}',
                  style: TextStyle(
                    color: (genderModel.isSelected.isTrue)
                        ? Colors.white
                        : ColorUtils.textColor,
                    fontSize: (genderModel.isSelected.isTrue) ? 16.0 : 14.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

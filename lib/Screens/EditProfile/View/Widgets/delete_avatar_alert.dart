import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/EditProfile/Controller/edit_profile_controller.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

class DeleteAvatarAlert extends StatelessWidget {
  const DeleteAvatarAlert({Key? key , required this.controller}) : super(key: key);


  final EditProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * .3,
      padding: paddingAll8,
      decoration: BoxDecoration(
        color: (Get.isDarkMode) ? ColorUtils.mainDarkColor : Colors.white,
        borderRadius: radiusAll10,
      ),
      child: Column(
        children: [
          Lottie.asset(
            'assets/anims/deleteAlert.json',
            height: Get.width * .3,
            width: Get.width * .3,
          ),
          AutoSizeText(
            'Are you sure for delete your avatar ?',
            maxLines: 1,
            maxFontSize: 16.0,
            minFontSize: 12.0,
            style: TextStyle(
              color:(Get.isDarkMode)?Colors.white: ColorUtils.textColor,
              fontSize: 14.0,
            ),
          ),
          SizedBox(
            height: Get.height * .05,
          ),
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Expanded(
      child: SizedBox(
        width: Get.width,
        height: double.maxFinite,
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: InkWell(
                onTap: () {
                  Get.back(result: false);
                },
                child: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: radiusAll8,
                  ),
                  child: const Center(
                    child: AutoSizeText(
                      'Cancel',
                      style: TextStyle(
                        color: ColorUtils.textColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Flexible(
              flex: 2,
              child: RoundedLoadingButton(
                width:double.maxFinite,
                height:double.maxFinite,
                borderRadius: 8,
                resetAfterDuration: false,
                // resetDuration: const Duration(
                //   seconds: 5,
                // ),
                color: ColorUtils.mainColor,
                controller: controller.btnController,
                onPressed: () {
                  controller.deleteAvatar();
                },
                elevation: 5.0,
                errorColor: ColorUtils.mainDarkColor,
                successColor: Colors.green.shade800,
                child: const Center(
                  child: AutoSizeText(
                     'Delete',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Bloc/blocs.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Screens/EditProfile/Controller/edit_profile_controller.dart';

class EditProfilePictureModal extends StatelessWidget {
  const EditProfilePictureModal({Key? key, required this.controller})
      : super(key: key);

  final EditProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: Get.width,
        height: (Blocs.user.user!.profilePicture is String)
            ? Get.height * .25
            : Get.height * .15,
        decoration: BoxDecoration(
          color: (Get.isDarkMode) ? ColorUtils.mainDarkColor : Colors.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

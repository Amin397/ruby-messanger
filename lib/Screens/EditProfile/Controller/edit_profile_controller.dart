import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Bloc/blocs.dart';
import 'dart:developer';
import '../View/Widgets/edit_profile_picture_modal.dart';

class EditProfileController extends GetxController {
  void editPicture() async {
    showModalBottomSheet(
      context: Get.context!,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => EditProfilePictureModal(
        controller: this,
      ),
    );
  }
}

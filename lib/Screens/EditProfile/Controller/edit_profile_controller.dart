import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/src/types/image_source.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:rubymessanger/Bloc/blocs.dart';

import '../../../MainModel/GetRouts.dart';
import '../../../Utils/StorageUtils.dart';
import '../../../Utils/project_request_utils.dart';
import '../../../Utils/view_utils.dart';
import '../../Home/Controller/home_controller.dart';
import '../../Home/View/Widget/exit_alert.dart';
import '../View/Widgets/delete_avatar_alert.dart';
import '../View/Widgets/edit_profile_picture_modal.dart';

class EditProfileController extends GetxController {
  ProjectRequestUtils request = ProjectRequestUtils();

  RxBool imageUploaded = true.obs;

  final ImagePicker picker = ImagePicker();
  XFile? image;
  CroppedFile? croppedFile;

  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  void editPicture() async {
    showModalBottomSheet(
      context: Get.context!,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => EditProfilePictureModal(
        controller: this,
      ),
    );
  }

  void chooseImage({required ImageSource source}) async {
    Get.back();
    imageUploaded(false);
    try {
      image = await picker.pickImage(
        source: source,
      );

      if (image != null) {
        croppedFile = await ImageCropper().cropImage(
          sourcePath: image!.path,
          compressFormat: ImageCompressFormat.png,
          compressQuality: 100,
          aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
          cropStyle: CropStyle.circle,
        );
        if (croppedFile != null) {
          uploadImage();
        }
      } else {
        ViewUtils.showError(errorMessage: 'Image Not Available');
      }
    } catch (e) {
      ViewUtils.showError(errorMessage: e.toString());
    }
  }

  void uploadImage() async {
    request
        .uploadProfileImage(
      filePath: croppedFile!.path,
    )
        .then((value) {
      if (value.statusCode == 200) {
        Blocs.user.setUserProfileImage(
            image: jsonDecode(value.body)['profile_picture']);
        // imageUploaded(true);
        imageUploaded(true);
      }
      print(value.statusCode);
      print(value.body);
    });
  }

  void showExitAlert() async {

    bool exit = await showDialog(
      context: Get.context!,
      builder: (BuildContext context) => const AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        content: ExitAlert(),
      ),
    );

    if (exit) {
      StorageUtils.setUserAccessToken(accessToken: null);
      StorageUtils.setUserRefreshToken(refreshToken: null);

      Get.offAndToNamed(
        NameRouts.splash,
      );
      Future.delayed(
        const Duration(milliseconds: 500),
        () {
          Get.delete<HomeController>();
          Get.delete<EditProfileController>();
        },
      );
    }
  }

  void deleteAvatarAlert() async {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        content: DeleteAvatarAlert(
          controller: this,
        ),
      ),
    );
  }

  void deleteAvatar()async {

    Map<String, dynamic> resMap;

    request.deleteAvatar().then((value){
      switch (value.statusCode) {
        case 200:
          {

            resMap = jsonDecode(value.body);
            btnController.success();

            Future.delayed(const Duration(seconds: 1) ,(){
              Get.back();
              Get.back();
              Blocs.user.removeUserProfileImage();
            });

            break;
          }
        case 600:
          {
            ViewUtils.showError(
              errorMessage: 'Something went wrong',
            );
            btnController.error();

            Future.delayed(const Duration(seconds: 2) , (){
              btnController.reset();
            });
            break;
          }
        case 700:
          {
            ViewUtils.showError(
              errorMessage: 'Something went wrong',
            );
            btnController.error();
            Future.delayed(const Duration(seconds: 2) , (){
              btnController.reset();
            });
            break;
          }
        default:
          {
            resMap = jsonDecode(value.body);
            btnController.error();
            ViewUtils.showError(
              errorMessage: resMap['detail'],
            );
            Future.delayed(const Duration(seconds: 3) , (){
              btnController.reset();
            });
            break;
          }
      }
    });
  }
}

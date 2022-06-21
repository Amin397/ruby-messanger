import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:rubymessanger/Utils/project_request_utils.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

class CompleteProfileController extends GetxController {
  ProjectRequestUtils request = ProjectRequestUtils();
  late final String userName;
  late final String mobile;
  final ImagePicker picker = ImagePicker();
  XFile? image;
  CroppedFile? croppedFile;

  RxInt currentIndex = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(
      initialPage: currentIndex.value,
    );

    // userName = Get.arguments['userName'];
    // mobile = Get.arguments['mobile'];
  }

  getImage({required ImageSource imageSource}) async {
    try {
      image = await picker.pickImage(
        source: imageSource,
      );

      if (image != null) {
        croppedFile = await ImageCropper().cropImage(
          sourcePath: image!.path,
          compressFormat: ImageCompressFormat.png,
          compressQuality: 100,
          cropStyle: CropStyle.circle,
        );
        if (croppedFile != null) {
          uploadImage();
          update(['profileImage']);
        }
      } else {
        ViewUtils.showError(errorMessage: 'Image Not Available');
      }
    } catch (e) {
      ViewUtils.showError(errorMessage: e.toString());
    }
  }

  void removeImage() {
    request.removeProfileImage().then((value){
      print(value.statusCode);
      print(value.body);
    });
    croppedFile = null;
    update(['profileImage']);
  }

  void uploadImage() async {
    request.uploadProfileImage(
      filePath: croppedFile!.path,
    ).then((value) {
      print(value.statusCode);
      print(value.body);
    });
  }

  void goToNext() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    currentIndex(currentIndex.value + 1);
  }

  void goToPrevious() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    currentIndex(currentIndex.value - 1);
  }
}

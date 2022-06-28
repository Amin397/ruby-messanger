import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:rubymessanger/Bloc/blocs.dart';
import 'package:rubymessanger/MainModel/GetRouts.dart';
import 'package:rubymessanger/MainModel/gender_model.dart';
import 'package:rubymessanger/Utils/StorageUtils.dart';
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
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  RxBool imageUploaded = false.obs;
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  List<GenderModel> genderList = [
    GenderModel(
        id: 0,
        isSelected: false.obs,
        title: 'Male',
        animation: 'assets/anims/male.json'),
    GenderModel(
        id: 1,
        isSelected: true.obs,
        title: 'Female',
        animation: 'assets/anims/female.json'),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(
      initialPage: currentIndex.value,
    );

    userName = Get.arguments['userName'];
    mobile = Get.arguments['mobile'];
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
          aspectRatio: CropAspectRatio(ratioX: 1 , ratioY: 1),
          cropStyle: CropStyle.circle,
        );
        if (croppedFile != null) {
          update(['profileImage']);
          uploadImage();
        }
      } else {
        ViewUtils.showError(errorMessage: 'Image Not Available');
      }
    } catch (e) {
      ViewUtils.showError(errorMessage: e.toString());
    }
  }

  void removeImage() {
    request.removeProfileImage().then((value) {
      if (value.statusCode == 200) {
        // Blocs.user.removeUserProfileImage();
        croppedFile = null;
        imageUploaded(false);
        update(['profileImage']);
      }
    });
  }

  void uploadImage() async {
    request
        .uploadProfileImage(
      filePath: croppedFile!.path,
    )
        .then((value) {
      if (value.statusCode == 200) {
        // Blocs.user.setUserProfileImage(
        //     image: jsonDecode(value.body)['profile_picture']);
        imageUploaded(true);
      }
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

  void changeGender({required GenderModel gender}) {
    genderList.map((e) => e.isSelected(false)).toList();
    gender.isSelected(true);
  }

  void completeRegister() async {
    request
        .completeRegister(
            gender: genderList
                .singleWhere((element) => element.isSelected.isTrue)
                .id,
            userName: userName,
            bio: bioController.text,
            firstName: firstNameController.text,
            lastName: lastNameController.text)
        .then((value) async{
      if (value.statusCode == 200) {
        await StorageUtils.setFirstLogin(isFirst: true);
        Get.toNamed(
          NameRouts.home,
          // duration: Duration(milliseconds: 500),

        );
      } else {}
    });
  }
}

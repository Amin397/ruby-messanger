import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:rubymessanger/Bloc/blocs.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/EditProfile/Controller/edit_profile_controller.dart';

class EditProfilePictureModal extends StatelessWidget {
  const EditProfilePictureModal({Key? key, required this.controller})
      : super(key: key);

  final EditProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        width: Get.width,
        height: (Blocs.user.user!.profilePicture is String)
            ? Get.height * .35
            : Get.height * .25,
        decoration: BoxDecoration(
          color: (Get.isDarkMode) ? ColorUtils.mainDarkColor : Colors.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(10.0),
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.clear),
              ),
            ),
            _buildBody()
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: StreamBuilder(
          stream: Blocs.user.getStream,
          builder: (ctx , i)=>Column(
            children: [
              Flexible(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    controller.chooseImage(
                      source: ImageSource.camera,
                    );
                  },
                  child: Container(
                    padding: paddingSymmetricH8,
                    width: Get.width,
                    height: double.maxFinite,
                    child: Row(
                      children: [
                        Lottie.asset(
                          'assets/anims/camera.json',
                          height: Get.width * .2,
                          width: Get.width * .2,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                'Choose from camera',
                                style: TextStyle(
                                  color: (Get.isDarkMode)
                                      ? Colors.white
                                      : ColorUtils.textColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 16.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    controller.chooseImage(source: ImageSource.gallery);
                  },
                  child: Container(
                    padding: paddingSymmetricH8,
                    width: Get.width,
                    height: double.maxFinite,
                    child: Row(
                      children: [
                        Lottie.asset(
                          'assets/anims/gallery.json',
                          height: Get.width * .2,
                          width: Get.width * .2,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                'Choose from gallery',
                                style: TextStyle(
                                  color: (Get.isDarkMode)
                                      ? Colors.white
                                      : ColorUtils.textColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 16.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if(Blocs.user.user!.profilePicture is String)Flexible(
                flex: 1,
                child: InkWell(
                  onTap: (){
                    controller.deleteAvatarAlert();
                  },
                  child: Container(
                    width: Get.width,
                    height: double.maxFinite,
                    padding: paddingSymmetricH8,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Get.width * .05,
                          ),
                          child: Lottie.asset(
                            'assets/anims/delete.json',
                            height: Get.width * .1,
                            width: Get.width * .1,
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                'Delete profile image',
                                style: TextStyle(
                                  color: (Get.isDarkMode)
                                      ? Colors.white
                                      : ColorUtils.textColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 16.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

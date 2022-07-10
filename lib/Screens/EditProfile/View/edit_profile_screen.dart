import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Bloc/blocs.dart';
import 'package:rubymessanger/Screens/EditProfile/Controller/edit_profile_controller.dart';
import 'package:rubymessanger/Screens/EditProfile/View/Widgets/build_user_profile_picture_widget.dart';

import 'Widgets/build_edit_profile_app_bar_widget.dart';


class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  final EditProfileController controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              BuildEditProfileAppBarWidget(
                controller: controller,
              ),
              BuildUserProfilePictureWidget(
                controller: controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

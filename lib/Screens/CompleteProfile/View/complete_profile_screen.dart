import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/Consts.dart';

import '../Controller/complete_profile_controller.dart';
import 'Widget/build_profile_image_widget.dart';

class CompleteProfileScreen extends StatelessWidget {
  CompleteProfileScreen({Key? key}) : super(key: key);

  final CompleteProfileController controller =
      Get.put(CompleteProfileController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          padding: paddingAll8,
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              SizedBox(
                height: Get.height * .035,
              ),
              BuildCompleteProfileImageWidget(
                controller: controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

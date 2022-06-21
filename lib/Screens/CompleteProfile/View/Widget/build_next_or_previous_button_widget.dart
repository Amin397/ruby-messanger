import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rubymessanger/Screens/CompleteProfile/Controller/complete_profile_controller.dart';

class BuildNextOrPreviousButtonWidget extends StatelessWidget {
  const BuildNextOrPreviousButtonWidget({Key? key, required this.controller})
      : super(key: key);
  final CompleteProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(()=>(controller.currentIndex.value == 3)?_buildSaveButton():SizedBox(
      height: Get.height * .05,
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

        ],
      ),
    ));
  }

  Widget _buildSaveButton() {
    return Container(
      width: Get.width,
      height: Get.height * .05,
      color: Colors.red,
    );
  }
}

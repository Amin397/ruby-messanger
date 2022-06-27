import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Screens/CompleteProfile/Controller/complete_profile_controller.dart';
import 'package:rubymessanger/Utils/widget_utils.dart';

import 'build_gender_select_widget.dart';

class BuildCompleteRegisterNameAndGenderWidget extends StatelessWidget {
  const BuildCompleteRegisterNameAndGenderWidget(
      {Key? key, required this.controller})
      : super(key: key);

  final CompleteProfileController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: SingleChildScrollView(

        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'First name :',
                style: TextStyle(
                  color: ColorUtils.textColor,
                  fontSize: 12.0,
                ),
              ),
            ),
            WidgetUtils.textFormField(
              maxLines: 1,
              textAlign: TextAlign.left,
              controller: controller.firstNameController,
              inputAction: TextInputAction.next,
              width: Get.width * .92,
              height: Get.height * .1,
              autoFocus: false,
              enable: true,
              onChange: (s) {
                if (s.length > 5) {
                  print(s);
                }
              },
              label: '',
              borderColor: Colors.grey,
              fillColor: Colors.white,
              focusedColor: ColorUtils.mainDarkColor,
              numeric: false,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Last name :',
                style: TextStyle(
                  color: ColorUtils.textColor,
                  fontSize: 12.0,
                ),
              ),
            ),
            WidgetUtils.textFormField(
              maxLines: 1,
              textAlign: TextAlign.left,
              controller: controller.lastNameController,
              inputAction: TextInputAction.next,
              width: Get.width * .92,
              height: Get.height * .1,
              autoFocus: false,
              enable: true,
              onChange: (s) {
                if (s.length > 5) {
                  print(s);
                }
              },
              label: '',
              borderColor: Colors.grey,
              fillColor: Colors.white,
              focusedColor: ColorUtils.mainDarkColor,
              numeric: false,
            ),
            SizedBox(
              height: Get.height * .01,
            ),
            BuildGenderSelectWidget(
              controller: controller,
            ),
            SizedBox(
              height: Get.height * .01,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Bio :',
                style: TextStyle(
                  color: ColorUtils.textColor,
                  fontSize: 12.0,
                ),
              ),
            ),
            WidgetUtils.textFormField(
              maxLines: 4,
              textAlign: TextAlign.left,
              controller: controller.bioController,
              inputAction: TextInputAction.done,
              width: Get.width * .92,
              height: Get.height * .15,
              autoFocus: false,
              enable: true,
              label: '',
              borderColor: Colors.grey,
              fillColor: Colors.white,
              focusedColor: ColorUtils.mainDarkColor,
              numeric: false,
            ),
          ],
        ),
      ),
    );
  }
}

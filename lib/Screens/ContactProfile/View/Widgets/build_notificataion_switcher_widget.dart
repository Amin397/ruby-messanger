import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/ContactProfile/Controller/contact_profile_controller.dart';

class BuildNotificationSwitcherWidget extends StatelessWidget {
  const BuildNotificationSwitcherWidget({Key? key, required this.controller})
      : super(key: key);

  final ContactProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * .1,
      padding: paddingAll16,
      child: Obx(
        () => Row(
          children: [
            Expanded(
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Notifications',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      (controller.switchValue.isTrue) ? 'On' : 'Off',
                      style: const TextStyle(
                        color: ColorUtils.textColor,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const VerticalDivider(),
            CupertinoSwitch(
              value: controller.switchValue.value,
              onChanged: (value) {
                controller.changeSwitch();
              },
            ),
          ],
        ),
      ),
    );
  }
}

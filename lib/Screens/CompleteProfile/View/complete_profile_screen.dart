import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';

import '../Controller/complete_profile_controller.dart';
import 'Widget/build_complete_register_name_and_gender_widget.dart';
import 'Widget/build_next_or_previous_button_widget.dart';
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
        backgroundColor: Colors.white,
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              SizedBox(
                height: Get.height * .05,
              ),
              Expanded(
                child: Container(
                  padding: paddingAll8,
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      _buildPageView(),
                      // BuildCompleteProfileImageWidget(
                      //   controller: controller,
                      // ),
                      SizedBox(
                        height: Get.height * .01,
                      ),
                      _buildRegisterProgress(),
                      SizedBox(
                        height: Get.height * .01,
                      ),
                      BuildNextOrPreviousButtonWidget(
                        controller: controller,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterProgress() {
    return Obx(
      () => Align(
        alignment: Alignment.centerLeft,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: (controller.currentIndex.value + 1) * (Get.width * .5),
          height: Get.height * .01,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: radiusAll10,
          ),
        ),
      ),
    );
  }

  Widget _buildPageView() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Expanded(
        child: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            children: [
              BuildCompleteRegisterImageWidget(
                controller: controller,
              ),
              BuildCompleteRegisterNameAndGenderWidget(
                controller:controller,
              )
            ],
          ),
        ),
      ),
    );
  }
}


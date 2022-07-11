import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/ContactProfile/Controller/contact_profile_controller.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

class BuildBioWidget extends StatelessWidget {
  BuildBioWidget({Key? key, required this.controller}) : super(key: key);

  final ContactProfileController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingAll10,
      width: Get.width,
      height: Get.height * .15,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'bio:',
              style: TextStyle(
                color: ColorUtils.textColor,
                fontSize: 12.0,
              ),
            ),
          ),
          Obx(
            () => Expanded(
              child: Container(
                padding: paddingAll8,
                height: double.maxFinite,
                width: double.maxFinite,
                child:(controller!.isLoaded.isTrue)? AutoSizeText(
                  controller!.model!.bio!,
                  maxFontSize: 16.0,
                  minFontSize: 10.0,
                  maxLines: 5,
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                ):ViewUtils.loadingAnimation(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Utils/view_utils.dart';
import 'package:rubymessanger/Utils/widget_utils.dart';

import '../../Controller/contact_profile_controller.dart';

class BuildContactInfoWidget extends StatelessWidget {
  const BuildContactInfoWidget({Key? key, required this.controller})
      : super(key: key);

  final ContactProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: Get.width,
        padding: paddingAll10,
        child: (controller.isLoaded.isTrue)
            ? Column(
                children: [
                  _buildInfoCard(
                    label: 'Phone :',
                    value: controller.model!.phoneNumber!,
                    icon: Icon(
                      Icons.mobile_friendly_rounded,
                      size: 20.0,
                      color:(Get.isDarkMode)?Colors.grey: ColorUtils.mainDarkColor,
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  _buildInfoCard(
                    label: 'Username :',
                    value: controller.model!.username!,
                    icon: Icon(
                      Icons.verified_user_rounded,
                      size: 20.0,
                      color:(Get.isDarkMode)?Colors.grey: ColorUtils.mainDarkColor,
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  _buildInfoCard(
                    label: 'Date of join :',
                    // value: controller.model!.dateJoined.toString()),
                    value: DateFormat.yMMMMd()
                        .format(controller.model!.dateJoined!),
                    icon: Icon(
                      Icons.date_range_outlined,
                      size: 20.0,
                      color:(Get.isDarkMode)?Colors.grey: ColorUtils.mainDarkColor,
                    ),
                  ),
                ],
              )
            : ViewUtils.loadingAnimation(),
      ),
    );
  }

  Widget _buildInfoCard({
    required String label,
    required String value,
    required Widget icon,
  }) {
    return SizedBox(
      width: Get.width,
      height: Get.height * .05,
      child: Row(
        children: [
          icon,
          const SizedBox(
            width: 6.0,
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12.0,
              color: ColorUtils.textColor,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  value,
                  maxLines: 1,
                  maxFontSize: 18.0,
                  minFontSize: 12.0,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

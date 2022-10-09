import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../Bloc/blocs.dart';
import '../../../../Const/ColorUtils.dart';
import '../../../../Const/Consts.dart';
import '../../Controller/edit_profile_controller.dart';

class BuildUserProfileInfoWidget extends StatelessWidget {
  const BuildUserProfileInfoWidget({Key? key, required this.controller})
      : super(key: key);

  final EditProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: paddingAll12,
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          children: [
            _buildInfoItem(
              icon: const Icon(
                Icons.phone_android_sharp,
                color: ColorUtils.textColor,
              ),
              title: ':Mobile',
              value: Blocs.user.user!.phoneNumber!,
            ),
            const Divider(),
            _buildInfoItem(
              icon: const Icon(
                Icons.person,
                color: ColorUtils.textColor,
              ),
              title: ':Name',
              value:
                  '${Blocs.user.user!.firstName!} ${Blocs.user.user!.lastName!}',
            ),
            const Divider(),
            _buildInfoItem(
              icon: const Icon(
                Icons.calendar_month,
                color: ColorUtils.textColor,
              ),
              title: ':Join at',
              value: DateFormat().format(Blocs.user.user!.dateJoined!),
            ),
            const Divider(),
            _buildInfoItem(
              icon: const Icon(
                Icons.info,
                color: ColorUtils.textColor,
              ),
              title: ':Bio',
              value: Blocs.user.user!.bio!,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem({
    required Widget icon,
    required String title,
    required String value,
  }) {
    return Flexible(
      flex: 1,
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: SizedBox(
                width: Get.width,
                height: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AutoSizeText(
                      title,
                      maxFontSize: 16.0,
                      minFontSize: 12.0,
                      maxLines: 1,
                      style: const TextStyle(
                        color: ColorUtils.textColor,
                        fontSize: 12.0,
                      ),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    icon,
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                width: Get.width,
                height: double.maxFinite,
                padding: paddingSymmetricH30,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: AutoSizeText(
                    value,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

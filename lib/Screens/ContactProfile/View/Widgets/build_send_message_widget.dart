import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/ContactProfile/Controller/contact_profile_controller.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

class BuildSendMessageWidget extends StatelessWidget {
  const BuildSendMessageWidget({Key? key, required this.controller})
      : super(key: key);

  final ContactProfileController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height * .15,
      child: Row(
        children: [
          _buildSendMessagePart(),
          _buildCallAndCopyNumberPart(),
        ],
      ),
    );
  }

  Widget _buildSendMessagePart() {
    return Flexible(
      flex: 1,
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        margin: paddingAll6,
        child: Column(
          children: [
            _buildColumnPart(
              text: 'Call',
              icon: Icon(
                Icons.call_rounded,
                size: 20.0,
                color: Colors.blue.shade700.withOpacity(.8),
              ),
            ),
            _buildColumnPart(
              text: 'Copy number',
              icon: Icon(
                Icons.copy,
                size: 20.0,
                color: Colors.blue.shade700.withOpacity(.8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCallAndCopyNumberPart() {
    return Flexible(
      flex: 1,
      child: Container(
        margin: paddingAll10,
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: ColorUtils.mainColor.withOpacity(.2),
          borderRadius: radiusAll8,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AutoSizeText(
              'Send Message',
              style: TextStyle(
                fontSize: 16.0,
                // color: ColorUtils.textColor,
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            Lottie.asset(
              (Get.isDarkMode)
                  ? 'assets/anims/sendMessageDark.json'
                  : 'assets/anims/sendMessage.json',
              height: 50.0,
              width: 50.0,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildColumnPart({
    required String text,
    required Widget icon,
  }) {
    return Flexible(
      flex: 1,
      child: Container(
        margin: paddingAll4,
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.2),
          borderRadius: radiusAll8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(text),
            const SizedBox(
              width: 6.0,
            ),
            icon
          ],
        ),
      ),
    );
  }
}

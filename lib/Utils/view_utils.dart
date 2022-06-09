import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';

class ViewUtils {
  static List<BoxShadow> shadow({
    Offset offset = const Offset(0.0, 0.0),
  }) {
    return [
      BoxShadow(
        color: (Get.isDarkMode) ? Colors.black12 : Colors.grey.withOpacity(.3),
        blurRadius: 5.0,
        spreadRadius: 3.0,
        offset: offset,
      ),
    ];
  }

  static void showError({
    String? errorMessage,
  }) {
    Get.snackbar(
      'Error',
      errorMessage!,
      leftBarIndicatorColor: ColorUtils.mainColor,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
      // borderRadius: 10.0,
      backgroundColor: ColorUtils.mainColor.withOpacity(.2),
      margin: EdgeInsets.only(
        bottom: Get.height * .15,
      ),
      padding: EdgeInsets.symmetric(
        vertical: Get.height * .03,
        horizontal: Get.width * .03,
      ),
      boxShadows: ViewUtils.shadow(),


    );
  }

  static void showSuccess({String? successMessage}) {
    Get.snackbar(
      'Success',
      successMessage!,
      leftBarIndicatorColor: ColorUtils.mainDarkColor,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
      // borderRadius: 10.0,
      boxShadows: ViewUtils.shadow(),
      backgroundColor: Colors.green.shade800.withOpacity(.2),
      margin: EdgeInsets.only(
        bottom: Get.height * .15,
      ),
      padding: EdgeInsets.symmetric(
        vertical: Get.height * .03,
        horizontal: Get.width * .03,
      ),
    );
  }
}

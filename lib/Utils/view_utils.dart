import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';

class ViewUtils {
  static List<BoxShadow> shadow({
    Offset offset = const Offset(0.0, 0.0),
  }) {
    return [
      BoxShadow(
        color: (Get.isDarkMode) ? Colors.black26 : Colors.grey.withOpacity(.3),
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


  static void onChange({String? string,
    TextEditingController? textEditingController,
    Function? func}) {
    func!();
    List<String> list = string!.split('');
    if (list.length > 0) {
      switch (list.length) {
        case 1:
          if (list[0] == '0') {
            textEditingController!.text = '0';
          } else {
            textEditingController!.clear();
          }
          break;
        case 2:
          if (list[1] == '9') {
            textEditingController!.text = '09';
          } else {
            textEditingController!.text = '0';
          }
          break;
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
          list.removeAt(0);
          list.removeAt(0);
          textEditingController!.text = '09' + list.join('');
          break;
      }
      Future.delayed(
        Duration.zero,
            () =>
        textEditingController!.selection = TextSelection.fromPosition(
          TextPosition(
            offset: textEditingController.text.length,
          ),
        ),
      );
    }
  }



}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewUtils {
  static List<BoxShadow> shadow({
    required Offset offset,
  }) {
    return [
      BoxShadow(
        color:(Get.isDarkMode)?Colors.black12:Colors.grey.withOpacity(.3),
        blurRadius: 5.0,
        spreadRadius: 3.0,
        offset: offset,
      ),
    ];
  }
}

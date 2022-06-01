import 'package:flutter/material.dart';

class ViewUtils {
  static List<BoxShadow> shadow({
    required Offset offset,
  }) {
    return [
      BoxShadow(
        color: Colors.grey.withOpacity(.3),
        blurRadius: 5.0,
        spreadRadius: 3.0,
        offset: offset,
      ),
    ];
  }
}

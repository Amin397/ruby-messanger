import 'package:flutter/material.dart';

class ViewUtils{


  static List<BoxShadow> shadow() {
    return [
      BoxShadow(
        color: Colors.grey.withOpacity(.3),
        blurRadius: 5.0,
        spreadRadius: 3.0,
        offset: const Offset(
          0.0,
          -3.0,
        ),
      ),
    ];
  }


}
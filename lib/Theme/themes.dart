import 'package:flutter/material.dart';

class Themes {
  // final lightTheme = ThemeData.light().copyWith(
  //   primaryColor: Colors.blueGrey[300],
  //
  // );

  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.blueGrey[1000],
    iconTheme: const IconThemeData(
      color: Colors.white,
      opacity: .8,
    ),
    textTheme: TextTheme().apply(bodyColor: Colors.white)
  );

}

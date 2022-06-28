import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rubymessanger/Theme/themes.dart';

import 'MainModel/GetRouts.dart';


String baseUrl = 'http://ruby.alirn.ir';
Future<void> main() async {

  ///TODO : add 2 language
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: PageRout.pages,
      initialRoute: NameRouts.splash,
      theme: ThemeData(
        fontFamily: 'iranSanc',
        primaryColor: Colors.blueGrey[300],
        iconTheme: IconThemeData(
          color: Colors.blueGrey[1000],
          opacity: .8,
        ),
        textTheme: const TextTheme().apply(
          bodyColor: Colors.blueGrey.shade900,
        ),
      ),
      darkTheme: Themes().darkTheme,
    ),
  );
}

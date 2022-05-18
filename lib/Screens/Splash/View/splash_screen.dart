import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/spalsh_controller.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Screens/Home/Controller/home_controller.dart';

import 'Widget/home_back_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              HomeBackWidget(
                controller: controller,
              ),



            ],
          ),
        ),
      ),
    );
  }
}

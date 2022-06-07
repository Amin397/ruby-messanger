import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';

import '../Controller/intro_controller.dart';
import 'Widget/build_indicator_and_buttons_widget.dart';
import 'Widget/build_intro_pageView_widget.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key}) : super(key: key);

  final IntroController controller = Get.put(IntroController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // backgroundColor: ColorUtils.mainColor,
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              BuildIntroPageViewWidget(
                controller: controller,
              ),
              BuildIndicatorAndButtonsWidget(
                controller: controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

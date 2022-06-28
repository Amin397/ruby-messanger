import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rubymessanger/Const/Consts.dart';
import '../Controller/spalsh_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.red.shade800,
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/anims/ruby.json',
                height: Get.height * .2,
                width: Get.height * .2,
              ),
              SizedBox(
                height: Get.height * .08,
              ),
              _buildRubyText(),
              SizedBox(
                height: Get.height * .2,
              ),
              Obx(
                () => (controller.isTimeOut.isTrue)
                    ? _buildRetryWidget()
                    : const SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRubyText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          '..........',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        AutoSizeText(
          'Ruby',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'ruby',
            fontSize: 30.0,
            letterSpacing: 8.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '  ..........',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildRetryWidget() {
    return Container(
      margin: paddingAll6,
      // padding: paddingAll6,
      width: Get.width,
      height: Get.height * .06,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.3),
        borderRadius: radiusAll6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Container(
              margin: paddingAll6,
              height: Get.height * .05,
              width: Get.width * .2,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: radiusAll6,
              ),
              child: const Center(
                child: AutoSizeText(
                  'Retry',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            onTap: () {
              controller.isTimeOut(false);
              controller.getData();
            },
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Check your connection',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}

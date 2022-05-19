import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
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
              Row(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

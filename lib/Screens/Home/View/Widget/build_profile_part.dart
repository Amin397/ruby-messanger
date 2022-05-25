import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/Home/Controller/home_controller.dart';

class BuildProfilePart extends StatelessWidget {
  const BuildProfilePart({Key? key, required this.controller})
      : super(key: key);
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height * .15,
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Column(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    height: Get.height * .08,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: AutoSizeText(
                        'Amin Khademi',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: AutoSizeText(
                          '09383974483',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: Get.width * .03,
          ),
          _buildAvatar()
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return SizedBox(
      width: Get.height * .15,
      height: Get.height * .15,
      child: Stack(
        children: [
          AnimatedContainer(
              margin: paddingAll4,
              duration: const Duration(milliseconds: 300),
              width: Get.height * .15,
              height: Get.height * .15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.red.shade800,
                  width: 2.5,
                ),
                color: Colors
                    .primaries[Random().nextInt(Colors.primaries.length)]
                    .withOpacity(.5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: const Image(
                  image: AssetImage('assets/images/image.jpg'),
                  fit: BoxFit.cover,
                ),
              )),
          Align(
            alignment: Alignment.bottomRight,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: Get.width * .1,
              width: Get.width * .1,
              decoration: BoxDecoration(
                color: Colors.red.shade800,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

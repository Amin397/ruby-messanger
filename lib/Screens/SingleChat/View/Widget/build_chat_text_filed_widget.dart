import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Screens/SingleChat/Controller/single_chat_controller.dart';


class BuildChatTextFieldWidget extends StatelessWidget {
  const BuildChatTextFieldWidget({Key? key , required this.controller}) : super(key: key);


  final SingleChatController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .06,
      width: Get.width,
      color: Colors.red,
    );
  }
}

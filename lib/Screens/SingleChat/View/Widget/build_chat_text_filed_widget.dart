import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/SingleChat/Controller/single_chat_controller.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

class BuildChatTextFieldWidget extends StatelessWidget {
  const BuildChatTextFieldWidget({Key? key, required this.controller})
      : super(key: key);

  final SingleChatController controller;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: paddingAll8,
        // height: Get.height * .08,
        width: Get.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildMessageTextField(),
            SizedBox(
              width: Get.width * .03,
            ),
            _buildSendPart(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageTextField() {
    return Expanded(
      child: AnimatedContainer(
        constraints: BoxConstraints(
          maxHeight: Get.height * .15,
        ),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: ViewUtils.shadow(
            offset: const Offset(0.0, 0.0),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        duration: const Duration(milliseconds: 270),
        child: TextField(
          controller: controller.messageTextController,
          maxLines: 10,
          minLines: 1,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 0.2,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              borderSide: BorderSide(
                color: Colors.white,
                width: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSendPart() {
    return GestureDetector(
      onTap: (){
        controller.sendMessage();
      },
      child: Lottie.asset(
        'assets/anims/send.json',
        height: Get.width * .15,
        width: Get.width * .15,
        controller:controller.animationController,
        // repeat: false,
      ),
    );
  }
}

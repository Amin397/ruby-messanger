import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/single_chat_controller.dart';
import 'Widget/build_chat_body_widget.dart';
import 'Widget/build_chat_text_filed_widget.dart';
import 'Widget/single_chat_appBar_widget.dart';

class SingleChatScreen extends StatelessWidget {
  SingleChatScreen({Key? key}) : super(key: key);
  final SingleChatController controller = Get.put(
    SingleChatController(),
  );

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              SingleChatAppBarWidget(
                controller: controller,
              ),
              BuildChatBodyWidget(
                controller: controller,
              ),
              SizedBox(
                height: Get.height * .01,
              ),
              BuildChatTextFieldWidget(
                controller: controller,
              )
            ],
          ),
        ),
      ),
    );
  }
}

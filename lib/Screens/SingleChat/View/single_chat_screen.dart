import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/single_chat_controller.dart';
import 'Widget/build_chat_body_widget.dart';
import 'Widget/build_chat_text_filed_widget.dart';
import 'Widget/build_search_result_widget.dart';
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
              Expanded(
                child: SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Stack(
                    children: [
                      const SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        child: Image(
                          image: AssetImage(
                            'assets/images/chatPattern.jpg',
                          ),
                          repeat: ImageRepeat.repeat,
                        ),
                      ),
                      Container(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        color:(Get.isDarkMode)?Colors.black.withOpacity(.5): Colors.white.withOpacity(.5),
                      ),
                      SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        child: Column(
                          children: [
                            BuildChatBodyWidget(
                              controller: controller,
                            ),
                            SizedBox(
                              height: Get.height * .01,
                            ),
                            Obx(
                              () => AnimatedSwitcher(
                                duration: const Duration(milliseconds: 200),
                                transitionBuilder: (widget, animation) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: widget,
                                  );
                                },
                                child: (controller.isSearchClicked.isTrue)
                                    ? BuildSearchResultWidget(
                                        controller: controller,
                                      )
                                    : BuildChatTextFieldWidget(
                                        controller: controller,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

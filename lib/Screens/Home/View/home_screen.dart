import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/MainModel/GetRouts.dart';
import 'package:rubymessanger/Screens/Home/Controller/home_controller.dart';
import 'package:rubymessanger/Screens/Home/View/Widget/build_floating_create_new_chat_button_widget.dart';
import 'package:rubymessanger/Utils/view_utils.dart';
import 'Widget/home_back_widget.dart';
import 'Widget/home_front_widget.dart';

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
          child: Obx(
            () => Stack(
              children: [
                HomeBackWidget(
                  controller: controller,
                ),
                HomeFrontWidget(
                  controller: controller,
                ),
                (controller.isNewChat.isTrue)
                    ? _buildNewChatBackground()
                    : const SizedBox(),
                BuildFloatingCreateNewChatButtonWidget(
                  controller: controller,
                ),
                _buildCreateNewChat(),
                _buildCreateNewGroup(),
                _buildCreateNewChannel(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNewChatBackground() {
    return GestureDetector(
      onTap: () {
        controller.newChat();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: (controller.scrollTop.isTrue) ? Get.height : 0.0,
        width: Get.width,
        color: (Get.isDarkMode)
            ? ColorUtils.mainDarkColor.withOpacity(.9)
            : Colors.white.withOpacity(.9),
      ),
    );
  }

  Widget _buildCreateNewChannel() {
    return AnimatedPositioned(
      bottom: Get.width * .22,
      left: (controller.isNewChat.isTrue) ? Get.width * .55 : -200,
      duration: const Duration(milliseconds: 300),
      child: Container(
        padding: paddingAll6,
        width: Get.width * .4,
        decoration: BoxDecoration(
          color: Colors.blue,
          boxShadow: ViewUtils.shadow(),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50.0),
            bottomLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),
        ),
        child: _buildNewCardDetail(
          icon: Icons.notification_add,
          title: 'New Channel',
        ),
      ),
    );
  }

  Widget _buildCreateNewGroup() {
    return AnimatedPositioned(
      bottom: Get.width * .35,
      left: (controller.isNewChat.isTrue) ? Get.width * .55 : -200,
      duration: const Duration(milliseconds: 350),
      child: Container(
        padding: paddingAll6,
        width: Get.width * .4,
        decoration: BoxDecoration(
          color: Colors.blue,
          boxShadow: ViewUtils.shadow(),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50.0),
            bottomLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),
        ),
        child: _buildNewCardDetail(
          icon: Icons.group_add,
          title: 'New Group',
        ),
      ),
    );
  }

  Widget _buildCreateNewChat() {
    return AnimatedPositioned(
      bottom: Get.width * .48,
      left: (controller.isNewChat.isTrue) ? Get.width * .55 : -200,
      duration: const Duration(milliseconds: 400),
      child: GestureDetector(
        onTap: () {
          controller.newChat();
          Get.toNamed(
            NameRouts.newChat,
          );
        },
        child: Container(
          padding: paddingAll6,
          width: Get.width * .4,
          decoration: BoxDecoration(
            color: Colors.blue,
            boxShadow: ViewUtils.shadow(),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50.0),
              bottomLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            ),
          ),
          child: _buildNewCardDetail(
            icon: Icons.person_add,
            title: 'New Chat',
          ),
        ),
      ),
    );
  }

  Widget _buildNewCardDetail({
    required IconData icon,
    required String title,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(
          width: 8.0,
        ),
        AutoSizeText(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        )
      ],
    );
  }
}

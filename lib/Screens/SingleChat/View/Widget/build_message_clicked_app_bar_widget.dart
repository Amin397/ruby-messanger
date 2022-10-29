import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Screens/SingleChat/Controller/single_chat_controller.dart';

import '../../../../Const/ColorUtils.dart';
import '../../../../Const/Consts.dart';
import 'build_normal_appbar_widget.dart';

class BuildMessageClickedAppBarWidget extends StatelessWidget {
  const BuildMessageClickedAppBarWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SingleChatController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.goToSingleProfile();
      },
      child: SizedBox(
        height: Get.height * .07,
        width: Get.width,
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                controller.deleteMessage();
              },
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.white,
              ),
            ),
            Obx(
              () => (controller.listOfMessages
                          .where((element) => element.isSelected.isTrue)
                          .length ==
                      1)
                  ? IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    )
                  : const SizedBox(),
            ),
            const Expanded(
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
              ),
            ),
            Obx(() => AutoSizeText(
                  controller.listOfMessages
                      .where((element) => element.isSelected.isTrue)
                      .length
                      .toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                )),
            Padding(
              padding: paddingAll4,
              child: IconButton(
                onPressed: () {
                  controller.closeMessageClicked();
                },
                icon: const Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatTitle() {
    return Expanded(
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Align(
          alignment: Alignment.centerLeft,
          child: AutoSizeText(
            (controller.fromHome)
                ? controller.roomModel!.name!
                : '${controller.userModel!.firstName!} ${controller.userModel!.lastName!}',
            maxFontSize: 18.0,
            minFontSize: 12.0,
            maxLines: 1,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChatActions() {
    return SizedBox(
      height: double.maxFinite,
      width: Get.width * .2,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Center(
                child: PopupMenuButton<int>(
                  offset: const Offset(0, 50),
                  shape: const TooltipShape(),
                  onSelected: (item) {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  itemBuilder: (context) => [
                    _buildMuteItem(),
                    PopupMenuItem<int>(
                      onTap: () {
                        print('num 2');
                      },
                      value: 1,
                      child: Row(
                        children: [
                          const Icon(Icons.add),
                          SizedBox(
                            width: Get.width * .03,
                          ),
                          const Text('Settings')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Center(
                child: IconButton(
                  onPressed: () {
                    controller.switchToSearch();
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatAvatar() {
    String avatar = '';

    if (controller.fromHome) {
      avatar = controller.roomModel!.avatar!;
    } else {
      avatar = controller.userModel!.profilePicture!;
    }

    return Container(
      margin: paddingAll4,
      height: Get.width * .125,
      width: Get.width * .125,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: (avatar.length > 5)
            ? Hero(
                tag: (controller.fromHome)
                    ? 'chatProfile-${controller.index}'
                    : 'contactImage-${controller.index}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image(
                    image: NetworkImage(avatar),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : const Center(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  PopupMenuItem<int> _buildMuteItem() {
    return PopupMenuItem<int>(
      value: 0,
      child: PopupMenuButton(
        // offset: Offset(-Get.width * .475, 0),
        child: ListTile(
          leading: Image(
            color: (Get.isDarkMode) ? Colors.white : Colors.black,
            image: const AssetImage('assets/images/icons/mute.png'),
            height: Get.width * .07,
            width: Get.width * .07,
          ),
          title: const Text(
            'Mute',
            style: TextStyle(),
          ),
        ),
        itemBuilder: (_) {
          return [
            _buildMuteOptions(
              icon: 'assets/images/icons/1_mute.png',
              text: "Mute for 1 houre",
            ),
            _buildMuteOptions(
              icon: 'assets/images/icons/8_mute.png',
              text: "Mute for 8 houre",
            ),
            _buildMuteOptions(
              icon: 'assets/images/icons/24_mute.png',
              text: "Mute for 24 houre",
            ),
            _buildMuteOptions(
              icon: 'assets/images/icons/forever_mute.png',
              text: "Mute for ever",
            ),
          ];
        },
      ),
    );
  }

  PopupMenuItem<int> _buildMuteOptions({
    required String text,
    required String icon,
  }) {
    return PopupMenuItem(
      onTap: () {
        Future.delayed(const Duration(milliseconds: 100), () {
          Get.back();
        });
      },
      child: ListTile(
        leading: Image(
          image: AssetImage(icon),
          height: Get.width * .07,
          width: Get.width * .07,
        ),
        title: Text(
          text,
          style: TextStyle(
            color: (Get.isDarkMode) ? Colors.white : ColorUtils.textColor,
          ),
        ),
      ),
    );
  }
}

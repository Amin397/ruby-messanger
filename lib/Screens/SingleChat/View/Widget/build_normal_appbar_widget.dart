import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/SingleChat/Controller/single_chat_controller.dart';

class BuildNormalAppbarWidget extends StatelessWidget {
  const BuildNormalAppbarWidget({Key? key, required this.controller})
      : super(key: key);

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
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildChatActions(),
            _buildChatTitle(),
            const SizedBox(
              width: 8.0,
            ),
            _buildChatAvatar(),
            Padding(
              padding: paddingAll4,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                ),
              ),
            )
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

    if(controller.fromHome){
      avatar = controller.roomModel!.avatar!;
    }else{
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
                tag: (controller.fromHome)?'chatProfile-${controller.index}':'contactImage-${controller.index}',
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

class TooltipShape extends ShapeBorder {
  const TooltipShape();

  final BorderSide _side = BorderSide.none;
  final BorderRadiusGeometry _borderRadius = BorderRadius.zero;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(_side.width);

  @override
  Path getInnerPath(
    Rect rect, {
    TextDirection? textDirection,
  }) {
    final Path path = Path();

    path.addRRect(
      _borderRadius.resolve(textDirection).toRRect(rect).deflate(_side.width),
    );

    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final Path path = Path();
    final RRect rrect = _borderRadius.resolve(textDirection).toRRect(rect);

    path.moveTo(0, 10);
    path.quadraticBezierTo(0, 0, 10, 0);
    path.lineTo(rrect.width - 50, 0);
    path.lineTo(rrect.width - 15, -15);
    path.lineTo(rrect.width - 10, 0);
    path.quadraticBezierTo(rrect.width, 0, rrect.width, 10);
    path.lineTo(rrect.width, rrect.height - 10);
    path.quadraticBezierTo(
        rrect.width, rrect.height, rrect.width - 10, rrect.height);
    path.lineTo(10, rrect.height);
    path.quadraticBezierTo(0, rrect.height, 0, rrect.height - 10);

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => RoundedRectangleBorder(
        side: _side.scale(t),
        borderRadius: _borderRadius * t,
      );
}

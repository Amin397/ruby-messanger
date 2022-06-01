import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/SingleChat/Controller/single_chat_controller.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

class SingleChatAppBarWidget extends StatelessWidget {
  const SingleChatAppBarWidget({Key? key, required this.controller})
      : super(key: key);
  final SingleChatController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * .1,
      decoration: BoxDecoration(
        color:
            (Get.isDarkMode) ? Colors.blueGrey.shade800 : Colors.red.shade800,
        boxShadow: (Get.isDarkMode)
            ? [
                const BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                )
              ]
            : ViewUtils.shadow(
                offset: const Offset(
                  0.0,
                  3.0,
                ),
              ),
      ),
      child: Column(
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height * .03,
          ),
          _buildAppBarBody(),
        ],
      ),
    );
  }

  Widget _buildAppBarBody() {
    return Expanded(
      child: SizedBox(
        height: double.maxFinite,
        width: Get.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildChatActions(),
            _buildChatTitle(),
            const SizedBox(width: 8.0,),
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
            controller.model.title,
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
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
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
                  onPressed: () {},
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
    String name = '';
    List<String> nameAvatar = [];
    if (controller.model.title.contains(' ')) {
      nameAvatar = controller.model.title.split(' ');
    }

    for (var o in nameAvatar) {
      print(o.substring(0, 1));
      name = name + o.substring(0, 1).toUpperCase();
    }

    return Container(
      margin: paddingAll4,
      height: Get.width * .125,
      width: Get.width * .125,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: (controller.model.image!.length > 5)
            ? Hero(
                tag: 'chatProfile-${controller.index}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image(
                    image: AssetImage(controller.model.image!),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : Center(
                child: AutoSizeText(
                  name,
                  maxFontSize: 18.0,
                  minFontSize: 10.0,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/SingleChat/Controller/single_chat_controller.dart';
import 'package:rubymessanger/Utils/widget_utils.dart';

class BuildSearchBarWidget extends StatelessWidget {
  const BuildSearchBarWidget({Key? key, required this.controller})
      : super(key: key);

  final SingleChatController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * .07,
      color:(Get.isDarkMode)?Colors.transparent: Colors.white,
      padding: paddingAll4,
      child: Row(
        children: [
          Expanded(
            child: WidgetUtils.textFormField(
              controller: controller.searchTextController,
              autoFocus: true,
              enable: true,
              width: double.maxFinite,
              height: double.maxFinite,
              label: 'جست و جو ',
              fillColor: Colors.transparent,
              hintSize: 14.0,
              hintTextColor: Colors.grey,
              numeric: false,
              focusedColor: Colors.grey[300],
              borderColor: Colors.transparent,
              maxLines: 1,
              inputAction: TextInputAction.search,
              maxLength: 100,
              func: (s) {},
              textAlign: TextAlign.right,
            ),
          ),
          IconButton(
            onPressed: () {
              controller.cancelSearch();
            },
            icon: const Icon(Icons.close),
          )
        ],
      ),
    );
  }
}

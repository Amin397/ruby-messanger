import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/NewChat/Controller/new_chat_controller.dart';
import 'package:rubymessanger/Utils/view_utils.dart';
import 'package:rubymessanger/Utils/widget_utils.dart';

class BuildNewChatAppBarWidget extends StatelessWidget {
  const BuildNewChatAppBarWidget({Key? key, required this.controller})
      : super(key: key);

  final NewChatController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * .1,
      decoration: BoxDecoration(
        boxShadow: ViewUtils.shadow(),
      ),
      child: Column(
        children: [
          Container(
            height: Get.height * .03,
            color: (Get.isDarkMode)
                ? ColorUtils.mainDarkColor
                : ColorUtils.mainColor,
          ),
          Obx(
            () => AnimatedSwitcher(
              duration: const Duration(milliseconds: 10000),
              transitionBuilder: (widget, animation) => FadeTransition(
                opacity: animation,
                child: widget,
              ),
              child: (controller.isSearchClicked.isTrue)
                  ? _buildSearchAppBar()
                  : _buildNormalAppBar(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNormalAppBar() {
    return Container(
      height: Get.height * .07,
      width: Get.width,
      color: (Get.isDarkMode) ? ColorUtils.mainDarkColor : ColorUtils.mainColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.filter_alt_rounded,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.switchToSearch();
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: Get.height * .018,
            ),
            child: const AutoSizeText(
              'New Message',
              maxFontSize: 24.0,
              maxLines: 1,
              minFontSize: 16.0,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          WidgetUtils.backButton(),
        ],
      ),
    );
  }

  Widget _buildSearchAppBar() {
    return Container(
      width: Get.width,
      height: Get.height * .07,
      color: (Get.isDarkMode) ? Colors.transparent : Colors.white,
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
              label: 'Search ',
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

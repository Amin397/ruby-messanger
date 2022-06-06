import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/SingleChat/Controller/single_chat_controller.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

class BuildSearchResultWidget extends StatelessWidget {
  const BuildSearchResultWidget({Key? key, required this.controller})
      : super(key: key);
  final SingleChatController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * .065,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? Colors.blueGrey.shade800 : Colors.white,
        boxShadow: ViewUtils.shadow(
          offset: const Offset(0.0, -2.0),
        ),
      ),
      child: Row(
        children: [
          _buildArrowsPart(),
          const SizedBox(
            width: 8.0,
          ),
          _buildResultCount(),
        ],
      ),
    );
  }

  Widget _buildArrowsPart() {
    return Flexible(
      flex: 1,
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_up),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_down),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultCount() {
    return Flexible(
      flex: 1,
      child: Container(
        padding: paddingSymmetricH16,
        height: double.maxFinite,
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              '12',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(
              width: Get.width * .01,
            ),
            const Text('  of  '),
            SizedBox(
              width: Get.width * .01,
            ),
            const Text(
              '28',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(
              width: Get.width * .05,
            ),
            Icon(Icons.calendar_today_outlined),
          ],
        ),
      ),
    );
  }
}

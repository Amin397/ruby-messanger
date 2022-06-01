import 'package:flutter/material.dart';
import 'package:rubymessanger/Screens/SingleChat/Controller/single_chat_controller.dart';


class BuildChatBodyWidget extends StatelessWidget {
  const BuildChatBodyWidget({Key? key , required this.controller}) : super(key: key);


  final SingleChatController controller;

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
      ),
    );
  }
}

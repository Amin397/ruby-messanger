import 'package:flutter/material.dart';
import 'package:rubymessanger/MainModel/contact_model.dart';
import 'package:rubymessanger/Screens/NewChat/Controller/new_chat_controller.dart';

class BuildContactItemWidget extends StatelessWidget {
  const BuildContactItemWidget({
    Key? key,
    required this.controller,
    required this.contact,
    required this.index,
  }) : super(key: key);

  final NewChatController controller;
  final ContactModel contact;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

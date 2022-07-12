import 'dart:typed_data';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/NewChat/Model/contact_model.dart';
import 'package:rubymessanger/Screens/NewChat/Controller/new_chat_controller.dart';
import 'package:rubymessanger/Screens/SingleChat/View/Widget/build_normal_appbar_widget.dart';
import 'package:rubymessanger/Utils/view_utils.dart';
import 'package:rubymessanger/main.dart';

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
    return GestureDetector(
      onTap: () {
        controller.goToProfile(
          contact: contact,
          index: index,
        );
      },
      child: Container(
        width: Get.width,
        height: Get.height * .07,
        padding: paddingAll4,
        child: Row(
          children: [
            (!contact.isRubyUser!) ? _buildInviteCard() : const SizedBox(),
            _buildContactBody(),
            SizedBox(
              width: Get.width * .03,
            ),
            _buildAvatar(),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: Get.height * .06,
      height: Get.height * .06,
      decoration: BoxDecoration(
        color: (contact.profilePicture is String)
            ? Colors.transparent
            : Colors.blue,
        shape: BoxShape.circle,
        boxShadow: ViewUtils.shadow(),
      ),
      child: (contact.profilePicture is String)
          ? ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Hero(
                tag: 'contactImage-$index',
                child: Image(
                  image: NetworkImage(
                    contact.profilePicture!,
                  ),
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
    );
  }

  Widget _buildContactBody() {
    return Expanded(
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Align(
          alignment: Alignment.centerLeft,
          child: AutoSizeText(
            contact.name!,
            maxFontSize: 20.0,
            minFontSize: 14.0,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInviteCard() {
    return Container(
      // height: 50.0,
      padding: paddingAll8,
      decoration: BoxDecoration(
        borderRadius: radiusAll6,
        color: Colors.blue,
      ),
      child: const Text(
        'Invite',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.0,
        ),
      ),
    );
  }
}

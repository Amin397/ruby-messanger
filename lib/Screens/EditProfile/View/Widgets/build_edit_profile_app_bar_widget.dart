import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rubymessanger/Bloc/blocs.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Screens/EditProfile/Controller/edit_profile_controller.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

import '../../../../Utils/widget_utils.dart';
import '../../../SingleChat/View/Widget/build_normal_appbar_widget.dart';
import 'build_user_profile_picture_widget.dart';

class BuildEditProfileAppBarWidget extends StatelessWidget {
  const BuildEditProfileAppBarWidget({Key? key, required this.controller})
      : super(key: key);

  final EditProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .45,
      width: Get.width,
      decoration: BoxDecoration(
        color:
            (Get.isDarkMode) ? ColorUtils.mainDarkColor : ColorUtils.mainColor,
        boxShadow: ViewUtils.shadow(),
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(16.0),
        ),
      ),
      // padding: paddingAll8,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            right: -Get.width * .95,
            top: -Get.width * .95,
            child: Container(
              height: Get.width * 1.8,
              width: Get.width * 1.8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white12,
              ),
            ),
          ),
          Positioned(
            right: -Get.width * .95,
            top: -Get.width * .95,
            child: Container(
              height: Get.width * 1.6,
              width: Get.width * 1.6,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white12,
              ),
            ),
          ),
          _buildAppBar(),
          Center(
            child: BuildUserProfilePictureWidget(
              controller: controller,
            ),
          ),
          _buildUserData(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SafeArea(
      child: SizedBox(
        width: Get.width,
        height: Get.height * .06,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PopupMenuButton<int>(
              offset: const Offset(0, 50),
              shape: const TooltipShape(),
              onSelected: (item) {
                // print(item);
                if(item == 1){
                  controller.showExitAlert();
                }
              },
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  onTap: () {
                    print('num 1');
                  },
                  value: 0,
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit,
                        color: (Get.isDarkMode) ? Colors.white30 : Colors.grey,
                      ),
                      SizedBox(
                        width: Get.width * .03,
                      ),
                      const Text('Edit name')
                    ],
                  ),
                ),
                PopupMenuItem<int>(
                  onTap: () {

                  },
                  value: 1,
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: ColorUtils.mainColor,
                      ),
                      SizedBox(
                        width: Get.width * .03,
                      ),
                      Text(
                        'Log Out',
                        style: TextStyle(
                          color: ColorUtils.mainColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const AutoSizeText(
              'Profile',
              maxFontSize: 18.0,
              minFontSize: 12.0,
              maxLines: 1,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            WidgetUtils.backButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserData() {
    String date = '';

    date = DateFormat().format(Blocs.user.user!.lastLogin!);
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: Get.width,
        height: Get.height * .115,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              Blocs.user.user!.username!,
              maxLines: 1,
              maxFontSize: 20.0,
              minFontSize: 16.0,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontFamily: 'HeavyMont',
              ),
            ),
            AutoSizeText(
              'Last login: $date',
              maxLines: 1,
              maxFontSize: 20.0,
              minFontSize: 16.0,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontFamily: 'mont',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

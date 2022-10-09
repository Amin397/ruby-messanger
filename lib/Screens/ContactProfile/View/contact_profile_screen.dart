import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/ContactProfile/Controller/contact_profile_controller.dart';
import 'package:rubymessanger/main.dart';
import 'Widgets/build_bio_widget.dart';
import 'Widgets/build_contact_info_widget.dart';
import 'Widgets/build_notificataion_switcher_widget.dart';
import 'Widgets/build_send_message_widget.dart';

class ContactProfileScreen extends StatelessWidget {
  ContactProfileScreen({Key? key}) : super(key: key);

  final ContactProfileController controller =
      Get.put(ContactProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  width: Get.width,
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * .03,
                      ),
                      BuildSendMessageWidget(
                        controller: controller,
                      ),
                      Padding(
                        padding: paddingSymmetricH24,
                        child: Divider(
                          color: ColorUtils.mainDarkColor.withOpacity(.5),
                        ),
                      ),
                      BuildContactInfoWidget(
                        controller: controller,
                      ),
                      BuildBioWidget(
                        controller: controller,
                      ),
                      Padding(
                        padding: paddingSymmetricH24,
                        child: Divider(
                          color: ColorUtils.mainDarkColor.withOpacity(.5),
                        ),
                      ),
                      BuildNotificationSwitcherWidget(
                        controller: controller,
                      ),

                      
                      SizedBox(
                        height: Get.height * .25,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        title: AutoSizeText(
          controller.userName,
          maxLines: 1,
          maxFontSize: 16.0,
          minFontSize: 12.0,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        background: Hero(
          tag: 'contactImage-${controller.index}',
          child: Image.network(
            controller.profilePicture!,
            fit: BoxFit.cover,
          ),
        ),
      ),
      pinned: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert,
          ),
        )
      ],
      backgroundColor:
          (Get.isDarkMode) ? ColorUtils.mainDarkColor : ColorUtils.mainColor,
      expandedHeight: Get.height * .35,
    );
  }
}

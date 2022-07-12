import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rubymessanger/Bloc/blocs.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/MainModel/GetRouts.dart';
import 'package:rubymessanger/Screens/Home/Controller/home_controller.dart';
import 'package:rubymessanger/main.dart';

class BuildProfilePart extends StatelessWidget {
  const BuildProfilePart({Key? key, required this.controller})
      : super(key: key);
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Blocs.user.getStream,
      builder: (ctx, i) {
        return SizedBox(
          width: Get.width,
          height: Get.height * .15,
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        height: Get.height * .08,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            '${Blocs.user.user!.firstName} ${Blocs.user.user!.lastName!}',
                            style: const TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: AutoSizeText(
                              (Blocs.user.user!.phoneNumber == null)
                                  ? Blocs.user.user!.username!
                                  : Blocs.user.user!.phoneNumber!,
                              style: const TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: Get.width * .03,
              ),
              _buildAvatar()
            ],
          ),
        );
      },
    );
  }

  Widget _buildAvatar() {
    return SizedBox(
      width: Get.height * .15,
      height: Get.height * .15,
      child: Stack(
        children: [
          StreamBuilder(
            stream: Blocs.user.getStream,
            builder: (ctx, i) {
              return Container(
                margin: paddingAll4,
                width: Get.height * .15,
                height: Get.height * .15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.red.shade800,
                    width: 2.5,
                  ),
                ),
                child: Hero(
                  tag: 'profileImage',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: (Blocs.user.user!.profilePicture is String)
                        ? FadeInImage(
                            placeholder: const AssetImage(
                              'assets/anims/image_loading.gif',
                            ),
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              Blocs.user.user!.profilePicture!,
                            ),
                          )
                        : Image(
                            image: AssetImage(
                              (Blocs.user.user!.isMale!)
                                  ? 'assets/images/male_image.png'
                                  : 'assets/images/female_image.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: (){
                Get.toNamed(NameRouts.editProfile);
              },
              child: Container(
                height: Get.width * .1,
                width: Get.width * .1,
                decoration: BoxDecoration(
                  color: Colors.red.shade800,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

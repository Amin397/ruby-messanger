import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Bloc/blocs.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/EditProfile/Controller/edit_profile_controller.dart';
import 'package:rubymessanger/Utils/view_utils.dart';
import 'package:rubymessanger/main.dart';

class BuildUserProfilePictureWidget extends StatelessWidget {
  const BuildUserProfilePictureWidget({Key? key, required this.controller})
      : super(key: key);

  final EditProfileController controller;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Blocs.user.getStream,
      builder: (ctx, i) {
        return SizedBox(
          width: Get.height * .2,
          height: Get.height * .2,
          child: Stack(
            children: [
              Center(
                child: Container(
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
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: (){
                    controller.editPicture();
                  },
                  child: Container(
                    margin: paddingAll8,
                    height: Get.width * .12,
                    width: Get.width * .12,
                    decoration: BoxDecoration(
                      color: ColorUtils.mainColor,
                      shape: BoxShape.circle,
                      boxShadow: ViewUtils.shadow(),
                    ),
                    child:const Center(
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
      },
    );
  }
}

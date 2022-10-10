import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Bloc/blocs.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/EditProfile/Controller/edit_profile_controller.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

class BuildUserProfilePictureWidget extends StatelessWidget {
  const BuildUserProfilePictureWidget({Key? key, required this.controller})
      : super(key: key);

  final EditProfileController controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.editPicture();
        // print(Blocs.user.user!.profilePicture);
      },
      child: Stack(
        children: [
          StreamBuilder(
            stream: Blocs.user.getStream,
            builder: (ctx, i) {
              return Container(
                margin: paddingAll4,
                width: Get.height * .2,
                height: Get.height * .2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 1.5,
                  ),
                  boxShadow: ViewUtils.shadow(),
                ),
                child: Hero(
                  tag: 'profileImage',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: (Blocs.user.user!.profilePicture is String)
                        ? Image(
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
          Obx(
            () => (controller.imageUploaded.isTrue)
                ? const SizedBox()
                : Container(
                    margin: paddingAll4,
                    height: Get.height * .2,
                    width: Get.height * .2,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black26,
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

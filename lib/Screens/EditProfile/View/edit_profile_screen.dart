import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Bloc/blocs.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/main.dart';

import '../Controller/edit_profile_controller.dart';
import 'Widgets/build_edit_profile_app_bar_widget.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  final EditProfileController controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              BuildEditProfileAppBarWidget(
                controller: controller,
              ),

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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: (Blocs.user.user!.profilePicture is String)
                          ? FadeInImage(
                        placeholder: const AssetImage(
                          'assets/anims/image_loading.gif',
                        ),
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          baseUrl + Blocs.user.user!.profilePicture!,
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

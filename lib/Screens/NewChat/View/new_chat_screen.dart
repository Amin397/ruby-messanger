import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import '../Controller/new_chat_controller.dart';
import 'Widgets/build_new_chat_appBar_widget.dart';
import 'Widgets/build_new_chat_contact_list_widget.dart';

class NewChatScreen extends StatelessWidget {
  NewChatScreen({Key? key}) : super(key: key);

  final NewChatController controller = Get.put(NewChatController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {


            // controller.sendContacts();
            controller.showAddContact(
              context: context,
            );
          },
          backgroundColor: ColorUtils.mainColor,
          child: const Icon(
            Icons.person_add_alt,
            color: Colors.white,
          ),
        ),
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              BuildNewChatAppBarWidget(
                controller: controller,
              ),
              BuildNewChatContactListWidget(
                controller: controller,
              )
            ],
          ),
        ),
      ),
    );
  }
}

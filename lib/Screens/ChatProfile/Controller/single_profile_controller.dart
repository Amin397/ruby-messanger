import 'package:get/get.dart';
import 'package:rubymessanger/MainModel/chat_model.dart';


class SingleProfileController extends GetxController{
  late final RoomModel model;

  @override
  void onInit() {
    super.onInit();
    model = Get.arguments['profile'];
  }
}
import 'package:get/get.dart';

class CompleteProfileController extends GetxController{

  late final String userName;
  late final String mobile;

  @override
  void onInit() {
    super.onInit();


    userName = Get.arguments['userName'];
    mobile = Get.arguments['mobile'];


  }
}
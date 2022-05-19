import 'package:get/get.dart';
import 'package:rubymessanger/MainModel/GetRouts.dart';

class SplashController extends GetxController{


  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3) , (){
      Get.offAndToNamed(NameRouts.home);
    });
  }
}
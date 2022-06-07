import 'package:get/get.dart';
import 'package:rubymessanger/MainModel/GetRouts.dart';
import 'package:rubymessanger/Utils/StorageUtils.dart';

class SplashController extends GetxController{


  @override
  void onInit() {
    super.onInit();

    getData();
  }

  void getData()async {

    StorageUtils.setFirstLogin(isFirst: false);


    Future.delayed(const Duration(seconds: 3) , ()async{
      if(await StorageUtils.getFirstLogin() is bool && await StorageUtils.getFirstLogin() == true){
        Get.offAndToNamed(NameRouts.home);
      }else{
        Get.offAndToNamed(NameRouts.intro);
      }
    });

  }
}
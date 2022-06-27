import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rubymessanger/Bloc/blocs.dart';
import 'package:rubymessanger/MainModel/GetRouts.dart';
import 'package:rubymessanger/Utils/StorageUtils.dart';
import 'package:rubymessanger/Utils/project_request_utils.dart';
import 'package:web_socket_channel/status.dart';

class SplashController extends GetxController {
  late ProjectRequestUtils request;

  @override
  void onInit() {
    request = ProjectRequestUtils();
    getData();
    super.onInit();
  }

  void getData() async {
    StorageUtils.getFirstLogin().then((value) async {
      if (value is bool) {
        if (await StorageUtils.getUserAccessToken() != null) {
          getUserFullData();
        } else {
          Get.offAndToNamed(NameRouts.registerLogin);
        }
      } else {
        Get.offAndToNamed(NameRouts.intro);
      }
    });

    // Future.delayed(const Duration(seconds: 3) , ()async{
    //   if(await StorageUtils.getFirstLogin() is bool && await StorageUtils.getFirstLogin() == true){
    //   }else{
    //
    //   }
    // });
  }

  void getUserFullData() async {
    Blocs.user.setAccessToken(token: await StorageUtils.getUserAccessToken());
    Blocs.user.setRefreshToken(token: await StorageUtils.getUserRefreshToken());
    request.getUserData().then((value) {
      if (value.statusCode == 200) {
        Blocs.user.setUserData(userData: jsonDecode(value.body));
        Get.offAndToNamed(NameRouts.home);
      }
    });
  }
}

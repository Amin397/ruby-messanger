import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rubymessanger/Bloc/blocs.dart';
import 'package:rubymessanger/MainModel/GetRouts.dart';
import 'package:rubymessanger/Utils/StorageUtils.dart';
import 'package:rubymessanger/Utils/project_request_utils.dart';
import 'package:rubymessanger/Utils/view_utils.dart';
import 'package:web_socket_channel/status.dart';

class SplashController extends GetxController {
  late ProjectRequestUtils request;

  RxBool isTimeOut = false.obs;

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

        }
      } else {
        Get.offAndToNamed(NameRouts.intro);
      }
    });
  }

  void getUserFullData() async {
    Blocs.user.setAccessToken(token: await StorageUtils.getUserAccessToken());
    Blocs.user.setRefreshToken(token: await StorageUtils.getUserRefreshToken());
    request.getUserData().then((value) {
      switch (value.statusCode) {
        case 200:
          {
            Blocs.user.setUserData(
              userData: jsonDecode(value.body),
            );
            Get.offAndToNamed(NameRouts.home);
            break;
          }
        case 600:
          {
            isTimeOut(true);
            break;
          }
        case 401:
          {
            Get.offAndToNamed(NameRouts.registerLogin);
            break;
          }
        case 700:
          {
            ViewUtils.showError(
              errorMessage: 'Something went wrong',
            );
            isTimeOut(true);
            break;
          }
        default:
          {
            ViewUtils.showError(
              errorMessage: 'Something went wrong',
            );
            break;
          }
      }
    });
  }
}

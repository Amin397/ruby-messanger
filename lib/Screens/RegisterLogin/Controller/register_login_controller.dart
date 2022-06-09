import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:rubymessanger/Bloc/blocs.dart';
import 'package:rubymessanger/MainModel/GetRouts.dart';
import 'package:rubymessanger/Utils/StorageUtils.dart';
import 'package:rubymessanger/Utils/project_request_utils.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

class RegisterLoginController extends GetxController {
  ProjectRequestUtils request = ProjectRequestUtils();
  TextEditingController userNameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  RxInt isUserNameVariable = 2.obs;
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  RxBool isLogin = true.obs;

  RxDouble passwordStrongValue = 0.0.obs;

  void switchToSignUp() {
    userNameTextController.clear();
    passwordTextController.clear();
    isLogin(!isLogin.value);
  }

  void loginRequest() async {
    Map<String, dynamic> resMap;

    request
        .login(
      userName: userNameTextController.text,
      password: passwordTextController.text,
    )
        .then((value) {
      switch (value.statusCode) {
        case 201:
          {
            resMap = jsonDecode(value.body);

            StorageUtils.setUserAccessToken(
              accessToken: resMap['access_token'],
            );
            StorageUtils.setUserRefreshToken(
              refreshToken: resMap['refresh_token'],
            );

            Blocs.user.setAccessToken(token: resMap['access_token']);
            Blocs.user.setRefreshToken(token: resMap['refresh_token']);

            getUserData();

            break;
          }
        default:
          {
            resMap = jsonDecode(value.body);
            btnController.error();
            ViewUtils.showError(
              errorMessage: resMap['detail'],
            );
            break;
          }
      }
    });

    // Timer(const Duration(seconds: 3), () {

    // });
  }

  void getUserData() async {
    request.getUserData().then((value) {
      switch (value.statusCode) {
        case 200:
          {
            btnController.success();
            Future.delayed(const Duration(seconds: 1), () {
              Get.offAndToNamed(
                NameRouts.home,
              );
            });
            break;
          }
        default:
          {
            break;
          }
      }
    });
  }

  void registerRequest() async {
    Map<String, dynamic> resMap;

    request
        .register(
      userName: userNameTextController.text,
      password: passwordTextController.text,
    )
        .then((value) {
      switch (value.statusCode) {
        case 201:
          {
            btnController.success();
            ViewUtils.showSuccess(
              successMessage: 'You are now a Ruby user 😁',
            );

            // resMap = jsonDecode(value.body);
            //
            // StorageUtils.setUserAccessToken(
            //   accessToken: resMap['access_token'],
            // );
            // StorageUtils.setUserRefreshToken(
            //   refreshToken: resMap['refresh_token'],
            // );
            //
            // Blocs.user.setAccessToken(token: resMap['access_token']);
            // Blocs.user.setRefreshToken(token: resMap['refresh_token']);
            //
            // getUserData();

            break;
          }
        default:
          {
            resMap = jsonDecode(value.body);
            btnController.error();
            ViewUtils.showError(
              errorMessage: resMap['username'][0],
            );
            break;
          }
      }
    });
  }

  void onChangePassword({required String text}) {
    passwordStrongValue.value = text.length / 10;
  }
}

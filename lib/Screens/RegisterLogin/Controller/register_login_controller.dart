import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:rubymessanger/Bloc/blocs.dart';
import 'package:rubymessanger/MainModel/GetRouts.dart';
import 'package:rubymessanger/Utils/StorageUtils.dart';
import 'package:rubymessanger/Utils/project_request_utils.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

import '../View/Widget/complete_register_modal.dart';

class RegisterLoginController extends GetxController {
  ProjectRequestUtils request = ProjectRequestUtils();
  TextEditingController userNameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController mobileTextController = TextEditingController();
  TextEditingController pinCodeTextController = TextEditingController();

  RxInt isUserNameVariable = 2.obs;
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  final RoundedLoadingButtonController btnController2 =
      RoundedLoadingButtonController();

  RxBool isLogin = true.obs;

  RxDouble passwordStrongValue = 0.0.obs;

  RxBool isOtpSend = false.obs;

  void switchToSignUp() {
    userNameTextController.clear();
    passwordTextController.clear();
    passwordStrongValue(0.0);
    isLogin(!isLogin.value);
  }

  void loginRequest() async {
  //   Get.toNamed(NameRouts.completeProfile, arguments: {
  //     'userName': userNameTextController.text.trim(),
  //     'mobile': '09383974483',
  //   });

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
            Future.delayed(const Duration(seconds: 3), () {
              showMobileModal();
            });

            resMap = jsonDecode(value.body);

            StorageUtils.setUserAccessToken(
              accessToken: resMap['access_token'],
            );
            StorageUtils.setUserRefreshToken(
              refreshToken: resMap['refresh_token'],
            );

            Blocs.user.setAccessToken(token: resMap['access_token']);
            Blocs.user.setRefreshToken(token: resMap['refresh_token']);

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

  void showMobileModal() {
    showModalBottomSheet(
      context: Get.context!,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      enableDrag: true,
      isScrollControlled: true,
      builder: (BuildContext context) => CompleteRegisterModal(
        controller: this,
      ),
    );
  }

  void sendOtpCode({required String mobile}) async {
    request
        .sendMobile(
      mobileNumber: mobile,
    )
        .then((value) {
      if (value.statusCode == 200) {
        btnController2.success();
        ViewUtils.showSuccess(successMessage: jsonDecode(value.body)['detail']);
        isOtpSend(true);
      } else {
        btnController2.error();
        ViewUtils.showSuccess(successMessage: jsonDecode(value.body)['detail']);
      }
    });
  }

  void checkOtpCode() async {
    request
        .checkOtpCode(
      code: pinCodeTextController.text,
    )
        .then((value) {
      if (value.statusCode == 202) {
        ViewUtils.showSuccess(successMessage: 'code checked ✅');
        btnController2.success();
        Future.delayed(const Duration(seconds: 4), () {
          Get.offAndToNamed(NameRouts.completeProfile, arguments: {
            'userName': userNameTextController.text.trim(),
            'mobile': mobileTextController.text.trim(),
          });
        });
      } else {
        ViewUtils.showError(errorMessage: 'code incorrect ❌');
        btnController2.error();
      }
    });
  }
}

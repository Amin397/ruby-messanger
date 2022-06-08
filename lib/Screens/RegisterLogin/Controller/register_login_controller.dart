import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class RegisterLoginController extends GetxController{
  TextEditingController userNameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  RxInt isUserNameVariable = 2.obs;
  final RoundedLoadingButtonController btnController = RoundedLoadingButtonController();


  RxBool isLogin = true.obs;

  void switchToSignUp() {
    isLogin(!isLogin.value);
  }


  void doSomething() async {
    Timer(const Duration(seconds: 3), () {
      btnController.success();
    });
  }


}
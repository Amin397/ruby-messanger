import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/MainModel/user_model.dart';
import 'package:rubymessanger/Utils/project_request_utils.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

import '../../NewChat/Model/contact_model.dart';

class ContactProfileController extends GetxController{

  ProjectRequestUtils request = ProjectRequestUtils();


  late final ContactModel contact;
  UserModel? model;

  RxBool isLoaded = false.obs;
  RxBool switchValue = true.obs;
  int index = 0;



  @override
  void onInit() {
    contact = Get.arguments['contact'];
    index = Get.arguments['index'];
    getContactData();
    super.onInit();
  }

  void getContactData()async {
    request.getContactData(userId: contact.userId!).then((value){
      switch (value.statusCode) {
        case 200:
          {
            model = UserModel.fromJson(jsonDecode(value.body));
            isLoaded(true);
            break;
          }
        case 600:
          {
            ViewUtils.showError(
              errorMessage: value.body,
            );
            break;
          }
        case 700:
          {
            ViewUtils.showError(
              errorMessage: value.body,
            );
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

  void changeSwitch() {
    switchValue(!switchValue.value);
  }

}
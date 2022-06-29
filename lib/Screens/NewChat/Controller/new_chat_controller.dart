import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

import '../../../MainModel/contact_model.dart';

class NewChatController extends GetxController {

  List<Contact> contacts = [];
  List<ContactModel> listOfContact = [
    ContactModel(id: 0 ,number: '09383974483'),
    ContactModel(id: 0 ,number: '09383974483'),
    ContactModel(id: 0 ,number: '09383974483'),
    ContactModel(id: 0 ,number: '09383974483'),
    ContactModel(id: 0 ,number: '09383974483'),
    ContactModel(id: 0 ,number: '09383974483'),
    ContactModel(id: 0 ,number: '09383974483'),
    ContactModel(id: 0 ,number: '09383974483'),
  ];
  late ScrollController scrollController;

  RxBool isSearchClicked = false.obs;

  TextEditingController searchTextController = TextEditingController();

  void cancelSearch() {
    searchTextController.clear();
    isSearchClicked(false);
  }

  void switchToSearch() {
    isSearchClicked(true);
  }


  @override
  void onInit() {
    getContacts();
    scrollController = ScrollController(initialScrollOffset: 0.0);
    super.onInit();
  }

  void getContacts() async {
    if (await FlutterContacts.requestPermission()) {
       contacts = await FlutterContacts.getContacts();

       print('contacts.length');
       print(contacts.length);
    }else{

      ViewUtils.showError(errorMessage: 'We need your permission to access your contacts');
      Future.delayed(const Duration(seconds: 2) , (){
        Get.back();
        Get.back();
      });
    }
  }
}

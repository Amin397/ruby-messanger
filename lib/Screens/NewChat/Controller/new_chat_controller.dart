import 'dart:convert';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rubymessanger/MainModel/GetRouts.dart';
import 'package:rubymessanger/Screens/NewChat/View/Widgets/add_new_contact_modal_bottom_sheet.dart';
import 'package:rubymessanger/Utils/project_request_utils.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

import '../Model/contact_model.dart';

class NewChatController extends GetxController {
  List<Contact> contacts = [];
  List<ContactModel> showContact = [];
  List<Map<String, dynamic>> listOfContact = [];
  late ScrollController scrollController;
  RxBool isLoaded = false.obs;

  ProjectRequestUtils request = ProjectRequestUtils();
  RxBool isSearchClicked = false.obs;

  TextEditingController searchTextController = TextEditingController();
  TextEditingController addContactFirstNameTextController =
      TextEditingController();
  TextEditingController addContactLastNameTextController =
      TextEditingController();
  TextEditingController addContactPhoneNumberTextController =
      TextEditingController();

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

  void showAddContact({
    required BuildContext context,
  }) async {
    bool saveContact = await showModalBottomSheet(
      // backgroundColor: Colors.transparent,
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      enableDrag: false,
      builder: (
        BuildContext context,
      ) =>
          AddNewContactModalBottomSheet(
        controller: this,
      ),
    );

    if (saveContact) {
      final newContact = Contact();
      newContact.familyName = addContactLastNameTextController.text;
      newContact.givenName = addContactFirstNameTextController.text;
      newContact.phones = [
        Item(
            label: addContactPhoneNumberTextController.text,
            value: addContactPhoneNumberTextController.text)
      ];
      await ContactsService.addContact(newContact);
      contacts.add(newContact);
      update(['getContacts']);
      ViewUtils.showSuccess(successMessage: 'Contact Saved!');
    }
  }

  void getContacts() async {
    if (await Permission.contacts.status.isGranted) {
      contacts = await ContactsService.getContacts();

      for (var o in contacts) {
        showContact.add(
          ContactModel(
            phoneNumber: o.phones!.first.value!,
            isRubyUser: false,
            name: o.displayName,
          ),
        );
      }

      sendContacts();

      print('contacts.length');
      print(contacts.length);
    } else {
      await Permission.contacts.request();
      getContacts();
      // ViewUtils.showError(
      //     errorMessage: 'We need your permission to access your contacts');
      // Future.delayed(const Duration(seconds: 2), () {
      //   Get.back();
      //   Get.back();
      // });
    }
  }

  void sendContacts() async {
    listOfContact.clear();
    contacts
        .map((e) => listOfContact
            .add({'phone_number': e.phones!.first.value}))
        .toList();

    // print(listOfContact.first.runtimeType);

    request
        .sendContacts(
      mobileNumbers: listOfContact,
    )
        .then((value) {
      switch (value.statusCode) {
        case 200:
          {
            print(value.data);
            showContact = ContactModel.listFromJson(value.data);
            createContactItem();

            break;
          }
      }
    });
  }

  void createContactItem() {

    // showContact.map((e) => print(e.phoneNumber!.replaceAll('"', ''))).toList();
    // print('-------------');
    // contacts.map((e) => print(e.phones!.first.value)).toList();
    showContact.forEach((element1) {
      if (!element1.isRubyUser!) {
        element1.name = contacts
            .singleWhere((element) =>
                element.phones!.first.value == element1.phoneNumber!.replaceAll('"', ''))
            .displayName;
      }
    });

    isLoaded(true);
  }

  void goToProfile({required ContactModel contact , int? index}) {
    Get.toNamed(NameRouts.contactProfile , arguments: {
      'contact':contact,
      'index':index
    });
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/NewChat/Controller/new_chat_controller.dart';
import 'package:rubymessanger/Utils/view_utils.dart';
import 'package:rubymessanger/Utils/widget_utils.dart';

class AddNewContactModalBottomSheet extends StatelessWidget {
  const AddNewContactModalBottomSheet({Key? key, required this.controller})
      : super(key: key);
  final NewChatController controller;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back(
          result: false,
        );
        return false;
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SizedBox(
          height: Get.height * .8,
          width: Get.width,
          child: Column(
            children: [
              _buildAppBar(),
              SizedBox(
                height: Get.height * .04,
              ),
              Expanded(
                child: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  padding: paddingAll8,
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ' : First Name',
                          style: TextStyle(
                            color: ColorUtils.textColor,
                          ),
                        ),
                      ),
                      WidgetUtils.textFormField(
                        maxLines: 1,
                        func: (s) {},
                        textAlign: TextAlign.left,
                        controller:
                            controller.addContactFirstNameTextController,
                        inputAction: TextInputAction.done,
                        width: Get.width * .91,
                        height: Get.height * .1,
                        autoFocus: false,
                        enable: true,
                        onChange: (s) {},
                        label: '',
                        borderColor: Colors.grey,
                        fillColor: Colors.white,
                        focusedColor: ColorUtils.mainDarkColor,
                        numeric: false,
                      ),

                      // SizedBox(
                      //   height: Get.height * .02,
                      // ),

                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ' : Last Name',
                          style: TextStyle(
                            color: ColorUtils.textColor,
                          ),
                        ),
                      ),
                      WidgetUtils.textFormField(
                        maxLines: 1,
                        func: (s) {},
                        textAlign: TextAlign.left,
                        controller: controller.addContactLastNameTextController,
                        inputAction: TextInputAction.done,
                        width: Get.width * .91,
                        height: Get.height * .1,
                        autoFocus: false,
                        enable: true,
                        onChange: (s) {},
                        label: '',
                        borderColor: Colors.grey,
                        fillColor: Colors.white,
                        focusedColor: ColorUtils.mainDarkColor,
                        numeric: false,
                      ),

                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ' : Phone Number',
                          style: TextStyle(
                            color: ColorUtils.textColor,
                          ),
                        ),
                      ),
                      WidgetUtils.textFormField(
                        maxLines: 1,
                        func: (s) {},
                        textAlign: TextAlign.left,
                        controller:
                            controller.addContactPhoneNumberTextController,
                        inputAction: TextInputAction.done,
                        width: Get.width * .91,
                        height: Get.height * .1,
                        autoFocus: false,
                        enable: true,
                        // onChange: (s) {
                        //   ViewUtils.onChange(
                        //     string: s,
                        //     textEditingController:
                        //         controller.addContactPhoneNumberTextController,
                        //   );
                        // },
                        label: '',
                        borderColor: Colors.grey,
                        fillColor: Colors.white,
                        focusedColor: ColorUtils.mainDarkColor,
                        numeric: true,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      width: Get.width,
      height: Get.height * .07,
      decoration: BoxDecoration(
        color:
            (Get.isDarkMode) ? ColorUtils.mainDarkColor : ColorUtils.mainColor,
        boxShadow: ViewUtils.shadow(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildSaveButton(),
          Padding(
            padding: EdgeInsets.only(
              bottom: Get.height * .018,
            ),
            child: const AutoSizeText(
              'New Contact',
              maxFontSize: 24.0,
              maxLines: 1,
              minFontSize: 16.0,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              controller.addContactFirstNameTextController.clear();
              controller.addContactLastNameTextController.clear();
              controller.addContactPhoneNumberTextController.clear();
              Get.back(
                result: false,
              );
            },
            icon: const Icon(
              Icons.clear,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    return GestureDetector(
      onTap: () {
        Get.back(
          result: true,
        );
      },
      child: Container(
          width: Get.width * .2,
          height: Get.height * .05,
          margin: EdgeInsets.only(
            bottom: Get.height * .01,
            right: Get.width * .02,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: ViewUtils.shadow(),
            borderRadius: radiusAll16,
          ),
          child: const Center(
            child: AutoSizeText(
              'Save',
              maxLines: 1,
              maxFontSize: 20.0,
              minFontSize: 10.0,
              style: TextStyle(
                color: ColorUtils.textColor,
                fontSize: 16.0,
              ),
            ),
          )),
    );
  }
}

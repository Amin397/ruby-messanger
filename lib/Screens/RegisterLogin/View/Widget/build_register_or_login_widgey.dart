import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Utils/widget_utils.dart';

import '../../Controller/register_login_controller.dart';

class BuildRegisterOrLoginWidget extends StatelessWidget {
  const BuildRegisterOrLoginWidget({Key? key, required this.controller})
      : super(key: key);

  final RegisterLoginController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: Get.width,
        height: Get.height * .7,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12.0),
          ),
        ),
        // padding: EdgeInsets.only(
        //   top: Get.height * .1,
        // left: Get.width * .02,
        // right: Get.width * .02,
        // bottom: Get.height * .01,
        // ),
        padding: paddingAll10,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Obx(
                () => Text(
                  (controller.isLogin.isTrue) ? 'Sign in' : 'Sign up',
                  style: const TextStyle(
                    color: ColorUtils.textColor,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * .03,
            ),
            Expanded(
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: GetBuilder(
                  init: controller,
                  builder: (ctx) => Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ': User name ',
                          style: TextStyle(
                            color: ColorUtils.textColor,
                          ),
                        ),
                      ),
                      WidgetUtils.textFormField(
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        controller: controller.userNameTextController,
                        inputAction: TextInputAction.done,
                        width: Get.width * .9,
                        height: Get.height * .06,
                        autoFocus: true,
                        enable: true,
                        onChange: (s) {
                          if (s.length > 5) {
                            print(s);
                          }
                        },
                        label: '',
                        borderColor: Colors.grey,
                        fillColor: Colors.white,
                        focusedColor: ColorUtils.mainDarkColor,
                        numeric: false,
                        prefixWidget: (controller.isUserNameVariable.value == 0)
                            ? const CircularProgressIndicator()
                            : (controller.isUserNameVariable.value == 1)
                                ? Icon(
                                    Icons.check_circle_outline,
                                    color: Colors.green.shade800,
                                  )
                                : (controller.isUserNameVariable.value == -1)
                                    ? Icon(
                                        Icons.highlight_remove,
                                        color: ColorUtils.mainColor,
                                      )
                                    : const SizedBox(),
                      ),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ' : Password',
                          style: TextStyle(
                            color: ColorUtils.textColor,
                          ),
                        ),
                      ),
                      WidgetUtils.textFormField(
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        controller: controller.passwordTextController,
                        inputAction: TextInputAction.done,
                        width: Get.width * .9,
                        height: Get.height * .06,
                        autoFocus: true,
                        enable: true,
                        onChange: (s) {},
                        label: '',
                        borderColor: Colors.grey,
                        fillColor: Colors.white,
                        focusedColor: ColorUtils.mainDarkColor,
                        numeric: false,
                        prefixWidget: (controller.isUserNameVariable.value == 0)
                            ? const CircularProgressIndicator()
                            : (controller.isUserNameVariable.value == 1)
                                ? Icon(
                                    Icons.check_circle_outline,
                                    color: Colors.green.shade800,
                                  )
                                : (controller.isUserNameVariable.value == -1)
                                    ? Icon(
                                        Icons.highlight_remove,
                                        color: ColorUtils.mainColor,
                                      )
                                    : const SizedBox(),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const AutoSizeText(
                            'Forgot Password',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * .03,
            ),
            _buildSignUpText(),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return RoundedLoadingButton(
      width: Get.width,
      height: Get.height * .05,
      borderRadius: 8,
      resetAfterDuration: true,
      resetDuration: const Duration(
        seconds: 5,
      ),
      color: ColorUtils.mainColor,
      controller: controller.btnController,
      onPressed: controller.doSomething,
      elevation: 5.0,
      errorColor: ColorUtils.mainDarkColor,
      successColor: Colors.green.shade800,
      child: Obx(
        () => Text(
          (controller.isLogin.isTrue) ? 'Sign in' : 'Sign up',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpText() {
    return SizedBox(
      width: Get.width,
      height: Get.height * .06,
      child: Obx(
        () => TextButton(
          child: AutoSizeText(
            (controller.isLogin.isTrue)
                ? 'Create account'
                : 'I have an account , SignIn',
            maxLines: 1,
            maxFontSize: 16.0,
            minFontSize: 10.0,
          ),
          onPressed: () {
            controller.switchToSignUp();
          },
        ),
      ),
    );
  }
}

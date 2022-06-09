import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Utils/view_utils.dart';
import 'package:rubymessanger/Utils/widget_utils.dart';

import '../../Controller/register_login_controller.dart';

class CompleteRegisterModal extends StatelessWidget {
  const CompleteRegisterModal({Key? key, required this.controller})
      : super(key: key);
  final RegisterLoginController controller;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: Get.width,
        padding: paddingAll8,
        height: Get.height * .85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12.0),
          ),
        ),
        child: Column(
          children: [
            _buildAnimationPart(),
            const Divider(),
            _buildBodyPart(),
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
      controller: controller.btnController2,
      onPressed: () {

      },
      elevation: 5.0,
      errorColor: ColorUtils.mainDarkColor,
      successColor: Colors.green.shade800,
      child: Obx(
            () => Text(
          (controller.isOtpSend.isTrue) ? 'Check code' : 'Send code',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  Widget _buildAnimationPart() {
    return Container(
      width: Get.width,
      height: Get.height * .2,
      padding: paddingAll6,
      child: Column(
        children: [
          const Text(
            'Congratulations',
            style: TextStyle(
              fontSize: 24.0,
              fontFamily: 'ruby',
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Expanded(
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Lottie.asset('assets/anims/celebe1.json'),
                  ),
                  Center(child: Lottie.asset('assets/anims/celebe2.json')),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Lottie.asset('assets/anims/celebe1.json'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBodyPart() {
    return Expanded(
      child: Container(
        padding: paddingAll6,
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          children: [
            const Text('You can enter your mobile number optionally'),
            const Text('So that the audience that uses Ruby can find you'),
            SizedBox(
              height: Get.height * .05,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Obx(
                  () => Text(
                    (controller.isOtpSend.isTrue)
                        ? 'Enter Otp Code'
                        : ' : Phone Number',
                    style: const TextStyle(
                      color: ColorUtils.textColor,
                      fontSize: 12.0,
                    ),
                  ),
                )),
            Obx(
              () => AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (widget, animation) => FadeTransition(
                  opacity: animation,
                  child: widget,
                ),
                child: (controller.isOtpSend.isTrue)
                    ? _buildPinCodeField()
                    : _buildMobileField(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileField() {
    return WidgetUtils.textFormField(
      maxLines: 1,
      textAlign: TextAlign.left,
      controller: controller.mobileTextController,
      inputAction: TextInputAction.done,
      width: Get.width * .9,
      height: Get.height * .1,
      autoFocus: true,
      enable: true,
      onChange: (String string) => ViewUtils.onChange(
          string: string,
          textEditingController:
          controller.mobileTextController,
          func: () {
            if (controller.mobileTextController.text.length ==
                11) {
              controller.sendOtpCode(
                mobile: controller.mobileTextController.text,
              );
            }
          }),
      formatter: [
        LengthLimitingTextInputFormatter(11),
      ],
      label: '',
      borderColor: Colors.grey,
      fillColor: Colors.white,
      focusedColor: ColorUtils.mainDarkColor,
      numeric: true,
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
    );
  }

  Widget _buildPinCodeField() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        length: 4,
        obscureText: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 65,
          fieldWidth: 50,
          fieldOuterPadding: EdgeInsets.symmetric(
            horizontal: Get.width * .05,
          ),
          inactiveFillColor: Colors.grey.withOpacity(.4),
          selectedColor: Colors.green,
          inactiveColor: Colors.white,
          selectedFillColor: Colors.white,
          activeFillColor: Colors.white,
        ),
        mainAxisAlignment: MainAxisAlignment.center,
        animationDuration: const Duration(milliseconds: 270),
        // backgroundColor: Colors.blue.shade50,
        enableActiveFill: true,
        // errorAnimationController: errorController,
        controller: controller.pinCodeTextController,
        onCompleted: (v) {
          FocusScope.of(Get.context!).unfocus();

          controller.checkOtpCode();
        },
        onChanged: (value) {
          // print(value);
          // setState(() {
          //   currentText = value;
          // });
        },
        textStyle: const TextStyle(
          fontSize: 28.0,
        ),
        autoFocus: true,
        keyboardType: TextInputType.number,
        beforeTextPaste: (text) {
          print("Allowing to paste $text");
          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
          //but you can show anything you want here, like your pop up saying wrong paste format or etc
          return true;
        },
        appContext: Get.context!,
      ),
    );
  }
}

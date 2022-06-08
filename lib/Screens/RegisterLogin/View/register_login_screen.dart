import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Const/Consts.dart';

import '../Controller/register_login_controller.dart';
import 'Widget/build_register_or_login_widgey.dart';

class RegisterLoginScreen extends StatelessWidget {
  RegisterLoginScreen({Key? key}) : super(key: key);

  final RegisterLoginController controller = Get.put(RegisterLoginController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              _buildAppBarPart(),
              BuildRegisterOrLoginWidget(
                controller: controller,
              ),
              // _buildDesign1(),
              // _buildDesign2(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesign1() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: Get.height * .5,
          right: Get.width * .05,
        ),
        child: Container(
          width: Get.width * .3,
          height: Get.width * .08,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 5.0),
                spreadRadius: 5.0,
                blurRadius: 10.0,
                blurStyle: BlurStyle.normal,
              ),
            ],
            color: ColorUtils.mainDarkColor,
            borderRadius: const BorderRadius.all(
              Radius.elliptical(80, 45),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesign2() {
    return Align(
      alignment: Alignment.centerRight,
      child: Lottie.asset(
        'assets/anims/ruby.json',
        height: Get.height * .15,
        width: Get.height * .15,
      ),
    );
  }

  Widget _buildAppBarPart() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: paddingAll8,
        width: Get.width,
        height: Get.height * .35,
        color: ColorUtils.mainColor,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {},
                child: const AutoSizeText(
                  'Ruby Messenger',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'ruby',
                    fontSize: 34.0,
                  ),
                )
              ),
            ),
            _buildDesign2(),
          ],
        ),
      ),
    );
  }
}

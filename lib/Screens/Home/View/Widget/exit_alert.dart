import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rubymessanger/Const/Consts.dart';
import 'package:rubymessanger/Screens/Home/Controller/home_controller.dart';


class ExitAlert extends StatelessWidget {
  const ExitAlert({Key? key }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Get.back(result: false);
        return false;
      },
      child: Container(
        height: Get.height * .32,
        width: Get.width,
        padding: paddingAll8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: radiusAll10,
        ),
        child: Column(
          children: [
            Lottie.asset(
              'assets/anims/logOut.json',
              height: Get.height * .2,
              width: Get.height * .2,
            ),
            SizedBox(
              height: Get.height * .03,
            ),
            _buildButtons()
          ],
        ),
      ),
    );
  }


  Widget _buildButtons() {
    return Expanded(
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        margin: paddingAll8,
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: InkWell(
                onTap: () {
                  Get.back(
                    result: false,
                  );
                },
                child: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: radiusAll8,
                  ),
                  child: const Center(
                    child: AutoSizeText(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: Get.width * .03,
            ),
            Flexible(
              flex: 1,
              child: InkWell(
                onTap: () {
                  Get.back(
                    result: true,
                  );
                },
                child: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: radiusAll8,
                  ),
                  child: const Center(
                    child: AutoSizeText(
                      'Logout',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



}

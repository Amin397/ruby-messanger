import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:palette_generator/palette_generator.dart';

class CompleteProfileController extends GetxController {
  late final String userName;
  late final String mobile;
  PaletteGenerator? paletteGenerator;
  final ImagePicker picker = ImagePicker();
  XFile? image;

  @override
  void onInit() {
    super.onInit();

    // userName = Get.arguments['userName'];
    // mobile = Get.arguments['mobile'];
    updatePaletteGenerator();
  }

  Future<PaletteGenerator> updatePaletteGenerator() async {
    print('start');
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.asset("assets/images/image.jpg").image,
    );
    update(['imageColor']);
    print(paletteGenerator!.paletteColors.first);
    return paletteGenerator!;
  }

  getImage({required ImageSource imageSource}) async {
    image = await picker.pickImage(
      source: imageSource,
    );
  }
}

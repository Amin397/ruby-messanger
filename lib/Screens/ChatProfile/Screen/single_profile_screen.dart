import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/single_profile_controller.dart';


class SingleProfileScreen extends StatelessWidget {
  SingleProfileScreen({Key? key}) : super(key: key);

  final SingleProfileController controller = Get.put(SingleProfileController());

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

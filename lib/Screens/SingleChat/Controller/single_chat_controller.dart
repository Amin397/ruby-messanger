import 'package:get/get.dart';

import '../../../MainModel/chat_model.dart';

class SingleChatController extends GetxController{




  late final ChatModel model;
  int index = 0;

  @override
  void onInit() {

    model = Get.arguments['item'];
    index = Get.arguments['index'];


    super.onInit();
  }
}
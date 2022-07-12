import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubymessanger/Const/ColorUtils.dart';
import 'package:rubymessanger/Screens/SingleChat/Controller/single_chat_controller.dart';
import 'package:rubymessanger/Screens/SingleChat/Model/message_model.dart';

class BuildMessageItemWidget extends StatelessWidget {
  const BuildMessageItemWidget({
    Key? key,
    required this.message,
    required this.controller,
    this.index,
  }) : super(key: key);

  final MessageModel message;
  final int? index;
  final SingleChatController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      width: Get.width,
      // child: Row(
      //   mainAxisAlignment: iAmTheFuckingSender
      //       ? MainAxisAlignment.start
      //       : MainAxisAlignment.end,
      //   children: [
      //     GestureDetector(
      //       onLongPress: () {
      //         // controller.unFocus();
      //         // controller.deleteMessageAlert(message: message);
      //       },
      //       child: Container(
      //         decoration: BoxDecoration(
      //           color: iAmTheFuckingSender
      //               ? ColorUtils.green.shade900
      //               : ColorUtils.mainRed,
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //         child: Padding(
      //           padding: const EdgeInsets.symmetric(
      //             horizontal: 8.0,
      //             vertical: 4.0,
      //           ),
      //           child: Column(
      //             crossAxisAlignment: iAmTheFuckingSender
      //                 ? CrossAxisAlignment.start
      //                 : CrossAxisAlignment.end,
      //             children: [
      //               Container(
      //                 constraints: BoxConstraints(
      //                   maxWidth: Get.width / 1.5,
      //                 ),
      //                 child: Text(
      //                   message.text!,
      //                   textAlign: TextAlign.right,
      //                   style: const TextStyle(
      //                     fontSize: 16.0,
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //               ),
      //               Row(
      //                 children: [
      //                   if (iAmTheFuckingSender)
      //                     const SizedBox(
      //                       width: 8.0,
      //                     ),
      //                   Text(
      //                     'message.time',
      //                     style: TextStyle(
      //                       color: Colors.white.withOpacity(0.8),
      //                       fontSize: 11.0,
      //                     ),
      //                   ),
      //                   const SizedBox(
      //                     width: 4.0,
      //                   ),
      //                   // Stack(
      //                   //   clipBehavior: Clip.none,
      //                   //   children: [
      //                   //     Icon(
      //                   //       message.id > 0
      //                   //           ? Icons.check
      //                   //           : Icons.timer_outlined,
      //                   //       color: Colors.white.withOpacity(0.8),
      //                   //       size: 12.0,
      //                   //     ),
      //                   //     if (message.isRead)
      //                   //       Positioned(
      //                   //         right: 5.0,
      //                   //         child: Icon(
      //                   //           Icons.check,
      //                   //           color: Colors.white.withOpacity(0.8),
      //                   //           size: 12.0,
      //                   //         ),
      //                   //       ),
      //                   //   ],
      //                   // ),
      //                   if (!iAmTheFuckingSender)
      //                     const SizedBox(
      //                       width: 8.0,
      //                     ),
      //                 ],
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

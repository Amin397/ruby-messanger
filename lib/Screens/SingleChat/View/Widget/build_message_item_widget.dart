import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rubymessanger/Const/Consts.dart';
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
    return Obx(
      () => InkWell(
        onTap: () {
          if (controller.isMessageClicked.isTrue) {
            controller.selectSingleMessage(message: message);
          }
        },
        onLongPress: () {
          if (!controller.isMessageClicked.isTrue) {
            controller.selectMessage(
              message: message,
            );
          }
        },
        child: AnimatedContainer(
          padding: (controller.isMessageClicked.isTrue)
              ? const EdgeInsets.symmetric(vertical: 6.0)
              : EdgeInsets.zero,
          duration: const Duration(milliseconds: 270),
          decoration: BoxDecoration(
            color: (message.isSelected.isTrue)
                ? Colors.blueAccent.withOpacity(.5)
                : Colors.transparent,
            borderRadius: radiusAll8,
          ),
          // margin: const EdgeInsets.symmetric(vertical: 2.0),
          width: Get.width,
          child: Row(
            mainAxisAlignment: (message.isMe)
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              if (controller.isMessageClicked.isTrue && message.isMe)
                _buildMessageSelect(),
              const SizedBox(
                width: 6.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: (message.isMe)
                      ? Colors.green.shade900
                      : Colors.blue.shade900,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular((message.isMe) ? 10.0 : 0.0),
                    topRight: Radius.circular((!message.isMe) ? 10.0 : 0.0),
                    bottomLeft: const Radius.circular(10.0),
                    bottomRight: const Radius.circular(10.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  child: Column(
                    crossAxisAlignment: (message.isMe)
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: Get.width / 1.5,
                        ),
                        child: Text(
                          message.text!,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          if (message.isMe)
                            const SizedBox(
                              width: 8.0,
                            ),
                          if (message.isMe)
                            Obx(
                              () {
                                if (message.isSend.isTrue) {
                                  return SizedBox(
                                    width: 30.0,
                                    height: 20.0,
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: const [
                                        Positioned(
                                          bottom: 0.0,
                                          right: 0.0,
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 16.0,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0.0,
                                          right: 4.0,
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 16.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  return Container(
                                    height: Get.width * .05,
                                    width: Get.width * .05,
                                    padding: paddingAll4,
                                    child: const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 1.5,
                                    ),
                                  );
                                }
                              },
                            ),
                          const SizedBox(
                            width: 12.0,
                          ),
                          Text(
                            '${message.dateAdded!.hour}:${message.dateAdded!.minute}',
                            // message.time!,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 11.0,
                            ),
                          ),
                          const SizedBox(
                            width: 4.0,
                          ),
                          if (!message.isMe)
                            const SizedBox(
                              width: 8.0,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 6.0,
              ),
              if (controller.isMessageClicked.isTrue && !message.isMe)
                _buildMessageSelect(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageSelect() {
    return Lottie.asset(
      'assets/anims/messageSelect.json',
      controller: message.controller,
      height: 40.0,
      width: 40.0,
      repeat: false,
    );
  }
}

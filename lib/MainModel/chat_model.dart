import 'package:get/get.dart';

class ChatModel {
  String? image;
  late String title;
  String? lastMessage;
  late bool fromMe;
  bool? seen;
  bool? gender;
  bool? delivered;
  RxInt unreadMessage;
  RxBool isSelected;

  ChatModel({
    this.image,
    this.gender,
    required this.title,
    required this.isSelected,
    this.lastMessage,
    this.delivered,
    required this.fromMe,
    required this.unreadMessage,
    this.seen,
  });
}

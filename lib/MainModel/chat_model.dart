import 'package:get/get.dart';

class ChatModel {
  String? image;
  late String title;
  String? lastMessage;
  late bool fromMe;
  bool? seen;
  bool? delivered;
  RxInt unreadMessage;

  ChatModel({
    this.image,
    required this.title,
    this.lastMessage,
    this.delivered,
    required this.fromMe,
    required this.unreadMessage,
    this.seen,
  });
}

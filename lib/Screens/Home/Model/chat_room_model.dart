import 'package:get/get.dart';

class ChatRoomModel {
  ChatRoomModel({
    this.id,
    this.isPv,
    this.roomId,
    this.lastMessage,
    this.timestamp,
    this.isPinned,
    this.isMuted,
    this.name,
    this.isLastFromMe,
    this.avatar,
    this.newMessage,
    required this.isSelected,
  });

  int? id;
  RxInt? newMessage;
  bool? isPv;
  int? roomId;
  String? lastMessage;
  String? name;
  String? avatar;
  DateTime? timestamp;
  bool? isPinned;
  bool? isMuted;
  bool? isLastFromMe;
  RxBool? isSelected;


  static List<ChatRoomModel> listFromJson(List data)=>data.map((e) => ChatRoomModel.fromJson(e)).toList();

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) => ChatRoomModel(
      id: json["id"],
      isPv: json["is_pv"],
      name: json["name"],
      avatar: json["avatar"],
      isLastFromMe: json["is_last_from_me"],
      roomId: json["room_id"],
      lastMessage: json["last_message"],
      timestamp: DateTime.parse(json["timestamp"]),
      isPinned: json["is_pinned"],
      isMuted: json["is_muted"],
      newMessage: 0.obs,
      isSelected: false.obs);

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_pv": isPv,
        "room_id": roomId,
        "last_message": lastMessage,
        "timestamp": timestamp!.toIso8601String(),
        "is_pinned": isPinned,
        "is_muted": isMuted,
      };
}

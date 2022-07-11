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
    required this.isSelected,
  });

  int? id;
  bool? isPv;
  int? roomId;
  String? lastMessage;
  DateTime? timestamp;
  bool? isPinned;
  bool? isMuted;
  RxBool? isSelected;

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) => ChatRoomModel(
    id: json["id"],
    isPv: json["is_pv"],
    roomId: json["room_id"],
    lastMessage: json["last_message"],
    timestamp: DateTime.parse(json["timestamp"]),
    isPinned: json["is_pinned"],
    isMuted: json["is_muted"],
    isSelected: false.obs
  );

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

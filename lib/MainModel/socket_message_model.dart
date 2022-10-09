class SocketMessageModel {
  SocketMessageModel({
    this.id,
    this.text,
    this.image,
    this.isUnread,
    this.dateAdded,
    this.dateUpdated,
    this.pvId,
    this.userId,
    this.replyId,
    this.roomId,
    this.avatar,
    this.isMale,
    this.name,
  });

  int? id;
  String? text;
  String? image;
  bool? isUnread;
  DateTime? dateAdded;
  DateTime? dateUpdated;
  int? pvId;
  int? userId;
  int? replyId;
  int? roomId;
  String? avatar;
  bool? isMale;
  String? name;

  factory SocketMessageModel.fromJson(Map<String, dynamic> json) => SocketMessageModel(
    id: json["id"],
    text: json["text"],
    image: json["image"],
    isUnread: json["is_unread"],
    dateAdded: DateTime.parse(json["date_added"]),
    dateUpdated: DateTime.parse(json["date_updated"]),
    pvId: json["pv_id"],
    userId: json["user_id"],
    replyId: json["reply_id"],
    roomId: json["room_id"],
    avatar: json["avatar"],
    isMale: json["is_male"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
    "image": image,
    "is_unread": isUnread,
    "date_added": dateAdded!.toIso8601String(),
    "date_updated": dateUpdated!.toIso8601String(),
    "pv_id": pvId,
    "user_id": userId,
    "reply_id": replyId,
    "room_id": roomId,
    "avatar": avatar,
    "is_male": isMale,
    "name": name,
  };
}

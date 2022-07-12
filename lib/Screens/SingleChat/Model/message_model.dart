class MessageModel {
  MessageModel({
    this.id,
    this.text,
    this.image,
    this.isReply,
    this.dateAdded,
    this.dateUpdated,
    this.pvId,
    this.pvMessageId,
  });

  int? id;
  String? text;
  String? image;
  bool? isReply;
  DateTime? dateAdded;
  DateTime? dateUpdated;
  int? pvId;
  dynamic pvMessageId;


  static List<MessageModel> listFromJson(List data){
    return data.map((e) => MessageModel.fromJson(e)).toList();
  }

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    id: json["id"],
    text: json["text"],
    image: json["image"],
    isReply: json["is_reply"],
    dateAdded: DateTime.parse(json["date_added"]),
    dateUpdated: DateTime.parse(json["date_updated"]),
    pvId: json["pv_id"],
    pvMessageId: json["pv_message_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
    "image": image,
    "is_reply": isReply,
    "date_added": dateAdded!.toIso8601String(),
    "date_updated": dateUpdated!.toIso8601String(),
    "pv_id": pvId,
    "pv_message_id": pvMessageId,
  };
}

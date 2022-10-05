

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rubymessanger/Bloc/blocs.dart';

class MessageModel {
  MessageModel({
    this.id,
    this.text,
    this.image,
    this.isUnread,
    this.dateAdded,
    this.dateUpdated,
    this.pvId,
    this.userId,
    this.replyId,
    this.time,
    required this.isMe,
    required this.isSend,
  });

  int? id;
  String? text;
  String? image;
  String? time;
  bool? isUnread;
  DateTime? dateAdded;
  DateTime? dateUpdated;
  int? pvId;
  int? userId;
  bool isMe;
  RxBool isSend;
  dynamic replyId;


  static List<MessageModel> listFromJson(List data){
    return data.map((e) => MessageModel.fromJson(e)).toList();
  }

  factory MessageModel.fromJson(Map<String, dynamic> json){
    var datetime = DateFormat(json["date_added"]).parse(json["date_added"] , true);
    var dateLocal = datetime.toLocal();
    String addTime = DateFormat.Hm().format(DateTime.parse(json["date_added"]).toLocal());
    return MessageModel(
      id: json["id"],
      text: json["text"],
      time: addTime,
      isSend: true.obs,
      // time: DateFormat.Hms(DateTime.parse(json["date_added"])).toString(),
      image: json["image"],
      isUnread: json["is_unread"],
      dateAdded: DateTime.parse(json["date_added"]).toLocal(),
      dateUpdated: DateTime.parse(json["date_updated"]).toLocal(),
      pvId: json["pv_id"],
      userId: json["user_id"],
      isMe:( json["user_id"] == Blocs.user.user!.id),
      replyId: json["reply_id"],
    );
  }

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
  };
}


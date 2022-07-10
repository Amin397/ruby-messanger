class ContactModel {
  ContactModel({
    this.name,
    this.phoneNumber,
    this.isRubyUser,
    this.userId,
    this.profilePicture,
    this.isOnline,
  });

  String? name;
  String? phoneNumber;
  bool? isRubyUser;
  int? userId;
  String? profilePicture;
  bool? isOnline;

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
    name: json["name"],
    phoneNumber: json["phone_number"],
    isRubyUser: json["is_ruby_user"],
    userId: json["user_id"],
    profilePicture: json["profile_picture"],
    isOnline: json["is_online"],
  );


  static List<ContactModel> listFromJson(List data){
    return data.map((e) => ContactModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone_number": phoneNumber,
    "is_ruby_user": isRubyUser,
    "user_id": userId,
    "profile_picture": profilePicture,
    "is_online": isOnline,
  };
}

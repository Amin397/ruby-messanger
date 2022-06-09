class UserModel {
  UserModel({
    this.id,
    this.profilePicture,
    this.username,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.dateJoined,
    this.lastLogin,
    this.isMale,
    this.bio,
  });

  int? id;
  String? profilePicture;
  String? username;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  DateTime? dateJoined;
  DateTime? lastLogin;
  bool? isMale;
  String? bio;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    profilePicture: json["profile_picture"],
    username: json["username"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    phoneNumber: json["phone_number"],
    dateJoined: DateTime.parse(json["date_joined"]),
    lastLogin: DateTime.parse(json["last_login"]),
    isMale: json["is_male"],
    bio: json["bio"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "profile_picture": profilePicture,
    "username": username,
    "first_name": firstName,
    "last_name": lastName,
    "phone_number": phoneNumber,
    "date_joined": dateJoined!.toIso8601String(),
    "last_login": lastLogin!.toIso8601String(),
    "is_male": isMale,
    "bio": bio,
  };
}

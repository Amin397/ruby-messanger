import 'dart:async';

import '../MainModel/user_model.dart';

class UserBloc {
  // ignore: close_sinks
  final streamController = StreamController.broadcast();

  /// The [getStream] getter would be used to expose our stream to other classes
  Stream get getStream => streamController.stream;



  late UserModel user;
  String accessToken = '';
  String refreshToken = '';



  void setUserData({required Map<String , dynamic> userData}){
    user = UserModel.fromJson(userData);
    streamController.sink.add(user);
  }


  void setAccessToken({required String token}){
    accessToken = token;
    streamController.sink.add(accessToken);
  }

  void setRefreshToken({required String token}){
    refreshToken = token;
    streamController.sink.add(refreshToken);
  }


}

import 'Storage.dart';

class StorageUtils {
  static Future<void> setFirstLogin({bool? isFirst}) async {
    await MyStorage.set(
      name: 'firstLogin',
      value: isFirst,
    );
  }


  static Future<void> setUserAccessToken({String? accessToken}) async {
    await MyStorage.set(
      name: 'accessToken',
      value: accessToken,
    );
  }

  static Future<dynamic> getUserAccessToken() async {
    return MyStorage.getString(
      name: 'accessToken',
    );
  }


  static Future<void> setUserRefreshToken({String? refreshToken}) async {
    await MyStorage.set(
      name: 'refreshToken',
      value: refreshToken,
    );
  }

  static Future<dynamic> getUserRefreshToken() async {
    return MyStorage.getString(
      name: 'refreshToken',
    );
  }

  static Future<dynamic> getFirstLogin() async {
    return MyStorage.getString(
      name: 'firstLogin',
    );
  }



}

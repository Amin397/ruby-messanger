import 'Storage.dart';

class StorageUtils {
  static Future<void> setFirstLogin({bool? isFirst}) async {
    await MyStorage.set(
      name: 'firstLogin',
      value: isFirst,
    );
  }

  static Future<dynamic> getFirstLogin() async {
    return MyStorage.getString(
      name: 'firstLogin',
    );
  }



}

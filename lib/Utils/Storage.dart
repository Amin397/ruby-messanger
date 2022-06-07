import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyStorage{


  static Future set({String? name , dynamic value})async{
    GetStorage box = GetStorage();
    if(value == null){
      box.remove('name');
    }
    return box.write(name!, value);
  }

  static dynamic getString({String? name}){
    GetStorage box = GetStorage();
    return box.read(name!);
  }
}
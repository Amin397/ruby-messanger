import 'package:http/http.dart' as http;
import 'package:rubymessanger/Bloc/blocs.dart';

import '../Const/web_controllers.dart';
import '../Const/web_methods.dart';
import 'base_request_util.dart';

class ProjectRequestUtils extends RequestsUtil {
  //sd

  Future<http.Response> register({
    String? userName,
    String? password,
  }) async {
    return await makeRequest(
        webMethod: WebMethods.register,
        webController: WebControllers.user,
        type: 'post',
        body: {
          'username': userName,
          'password': password,
        });
  }

  Future<http.Response> login({
    String? userName,
    String? password,
  }) async {
    return await makeRequest(
        webMethod: WebMethods.login,
        webController: WebControllers.user,
        type: 'post',
        body: {
          'username': userName,
          'password': password,
        });
  }

  Future<http.Response> getUserData() async {
    return await makeRequest(
        webMethod: WebMethods.login,
        webController: WebControllers.user,
        type: 'get',
        headers: {
          'Authorization': 'Bearer ${Blocs.user.accessToken}',
        });
  }
}

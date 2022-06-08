import 'package:http/http.dart' as http;

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
}

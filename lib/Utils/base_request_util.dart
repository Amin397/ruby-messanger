import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../Const/web_controllers.dart';
import '../Const/web_methods.dart';

class RequestsUtil {
  Future<http.Response> makeRequest({
    required WebMethods webMethod,
    required WebControllers webController,
    Map body = const {},
    Map<String, String> headers = const {},
    required String type,
  }) async {
    late http.Response response;

    print('Path: \n');
    print(makePath(webController: webController, webMethod: webMethod)
        .toString()
        .replaceAll('_', '-'));
    print('body: \n');
    print(body);
    print('header: \n');
    print(headers);

    print('type: \n');
    print(type);

    switch (type) {
      case 'post':
        {
          try {
            response = await http.post(
              makePath(
                webMethod: webMethod,
                webController: webController,
              ),
              body: body,
              headers: headers,
            );
          } catch (e) {
            print(e);
          }

          break;
        }
      case 'put':
        {
          try {
            response = await http.put(
              makePath(
                webMethod: webMethod,
                webController: webController,
              ),
              body: body,
              headers: headers,
            );
          } catch (e) {
            print(e);
          }
          break;
        }
      case 'patch':
        {
          try {
            response = await http.patch(
              makePath(
                webMethod: webMethod,
                webController: webController,
              ),
              body: body,
              headers: headers,
            );
          } catch (e) {
            print('TTTTTTTTTTTTTTTTTTTTTTT');
            print(e);
          }
          break;
        }
      case 'get':
        {
          break;
        }
    }

    print('status Code: \n');
    print(response.statusCode);

    print('response body: \n');
    print(response.body);

    return response;
  }

  Future<Response> makeFileRequest({
    required WebMethods webMethod,
    required WebControllers webController,
    String headers =  '',
    required String type,
    String? filePath ,
  }) async {
    late http.MultipartRequest request;
    late http.StreamedResponse response1;
    late Response response;

    print('Path: \n');
    print(makePath(webController: webController, webMethod: webMethod)
        .toString()
        .replaceAll('_', '-'));

    print('header: \n');
    print(headers);

    print('type: \n');
    print(type);

    switch (type) {
      case 'post':
        {

          break;
        }
      case 'put':
        {

          request = http.MultipartRequest(
            type.toUpperCase(),
            makePath(
              webMethod: webMethod,
              webController: webController,
            ),
          );
          request.headers['Authorization'] = headers;
          request.files.add(
            await http.MultipartFile.fromPath(
              'profile_picture',
              filePath!,
            ),
          );
          try {
            response1 = await request.send();
            response = await http.Response.fromStream(response1);
          } catch (e) {
            print(e);
          }

          // try {
          //   response = await http.put(
          //     makePath(
          //       webMethod: webMethod,
          //       webController: webController,
          //     ),
          //     body: body,
          //     headers: headers,
          //   );
          // } catch (e) {
          //   print(e);
          // }
          break;
        }
      case 'patch':
        {
          // try {
          //   response = await http.patch(
          //     makePath(
          //       webMethod: webMethod,
          //       webController: webController,
          //     ),
          //     body: body,
          //     headers: headers,
          //   );
          // } catch (e) {
          //   print('TTTTTTTTTTTTTTTTTTTTTTT');
          //   print(e);
          // }
          break;
        }
      case 'get':
        {
          break;
        }
    }

    print('status Code: \n');
    print(response.statusCode);

    print('response body: \n');
    print(response.body);

    return response;
  }

  Uri makePath({
    required WebControllers webController,
    required WebMethods webMethod,
  }) {
    return Uri.parse(
        'http://ruby.alirn.ir/${webController.name}/${webMethod.name}/'
            .replaceAll('_', '-'));
  }

//
// Future<ApiResult> makeRequest({
//   required WebControllers webController,
//   required WebMethods webMethod,
//   Map body = const {},
// }) async {
//   String url = _makePath(webController, webMethod);
//   if (debug) {
//     print("Request url: $url\nRequest body: ${jsonEncode(body)}\n");
//   }
//   Response response = await post(
//     url,
//     body,
//     headers: {
//       'token': RequestsUtil.token!,
//     },
//   );
//   ApiResult apiResult = ApiResult();
//   print(response.body);
//   if (response.statusCode == 200) {
//     try {
//       if (debug) {
//         print(response.body);
//       }
//       Map data = jsonDecode(response.body);
//       apiResult.isDone = data['isDone'] == true;
//       apiResult.requestedMethod = data['requestedMethod'].toString();
//       apiResult.data = data['data'];
//     } catch (e) {
//       apiResult.isDone = false;
//       apiResult.requestedMethod = webMethod.toString().split('.').last;
//       apiResult.data = response.body;
//     }
//   } else {
//     apiResult.isDone = false;
//   }
//   if (debug) {
//     print(
//         "\nRequest url: $url\nRequest body: ${jsonEncode(body)}\nResponse: {"
//         "status: ${response.statusCode}\n"
//         "isDone: ${apiResult.isDone}\n"
//         "requestedMethod: ${apiResult.requestedMethod}\n"
//         "data: ${apiResult.data}"
//         "}");
//   }
//   return apiResult;
// }
//
}

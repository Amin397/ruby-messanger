import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

import '../Const/web_controllers.dart';
import '../Const/web_methods.dart';
import '../main.dart';

class RequestsUtil {
  Future<http.Response> makeRequest({
    required WebMethods webMethod,
    required WebControllers webController,
    WebControllers? optionalWebMethod,
    Map body = const {},
    Map<String, String> headers = const {},
    required String type,
  }) async {
    late http.Response response;

    print('Path: \n');
    print(makePath(
      webController: webController,
      webMethod: webMethod,
      optionalController: optionalWebMethod,
    ).toString().replaceAll('_', '-'));
    print('body: \n');
    print(body);
    print('header: \n');
    print(headers);

    print('type: \n');
    print(type);


    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {

        switch (type) {
          case 'post':
            {
              try {
                response = await http.post(
                  makePath(
                    webMethod: webMethod,
                    webController: webController,
                    optionalController: optionalWebMethod,
                  ),
                  body: body,
                  headers: headers,
                ).timeout(const Duration(seconds: 40) , onTimeout: (){
                  ViewUtils.showError(errorMessage: 'Something went wrong');
                  return http.Response('Error', 600);
                });
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
                    optionalController: optionalWebMethod,
                  ),
                  body: body,
                  headers: headers,
                ).timeout(const Duration(seconds: 40) , onTimeout: (){
                  ViewUtils.showError(errorMessage: 'Something went wrong');
                  return http.Response('Error', 600);
                });
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
                    optionalController: optionalWebMethod,
                  ),
                  body: body,
                  headers: headers,
                ).timeout(const Duration(seconds: 40) , onTimeout: (){
                  ViewUtils.showError(errorMessage: 'Something went wrong');
                  return http.Response('Error', 600);
                });
              } catch (e) {
                print(e);
              }
              break;
            }
          case 'get':
            {
              try {
                response = await http.get(
                  makePath(
                    webMethod: webMethod,
                    webController: webController,
                    optionalController: optionalWebMethod,
                  ),
                  headers: headers,
                ).timeout(const Duration(seconds: 40) , onTimeout: (){
                  ViewUtils.showError(errorMessage: 'Something went wrong');
                  return http.Response('Error', 600);
                });
              } catch (e) {
                print(e);
              }
              break;
            }
        }

      }
    } on SocketException catch (_) {
      response = http.Response('connection field', 700);
      // isTimeOut(true);
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
    WebControllers? optionalWebController,
    String headers = '',
    required String type,
    String? filePath,
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
              optionalController: optionalWebController,
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

  Uri makePath({required WebControllers webController,
    required WebMethods webMethod,
    WebControllers? optionalController}) {
    if (optionalController != null) {
      return Uri.parse(
          '$baseUrl/${optionalController.name}/${webController.name}/${webMethod
              .name}/'
              .replaceAll('_', '-'));
    } else {
      return Uri.parse(
          '$baseUrl/${webController.name}/${webMethod.name}/'
              .replaceAll('_', '-'));
    }
  }
}
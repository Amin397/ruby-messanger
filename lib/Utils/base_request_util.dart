import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rubymessanger/Utils/view_utils.dart';

import '../Const/web_controllers.dart';
import '../Const/web_methods.dart';
import '../main.dart';

class RequestsUtil {
  Future<http.Response> makeHttpRequest({
    WebMethods? webMethod,
    required WebControllers webController,
    WebControllers? optionalWebMethod,
    String? pathVariable,
    Object body = const {},
    Map<String, String> headers = const {},
    Map<String, dynamic>? queryParameters,
    required String type,
  }) async {
    late http.Response response;

    print('Path: \n');

    print(makePath(
      webController: webController,
      webMethod: webMethod,
      optionalController: optionalWebMethod,
      pathVariable: pathVariable,
      queryParameters: queryParameters,
    ).toString().replaceAll('-', '_'));

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
                response = await http
                    .post(
                  makePath(
                    webMethod: webMethod,
                    webController: webController,
                    optionalController: optionalWebMethod,
                    pathVariable: pathVariable,
                    queryParameters: queryParameters,
                  ),
                  body: body,
                  headers: headers,
                )
                    .timeout(const Duration(seconds: 40), onTimeout: () {
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
                response = await http
                    .put(
                  makePath(
                    webMethod: webMethod,
                    webController: webController,
                    optionalController: optionalWebMethod,
                    pathVariable: pathVariable,
                    queryParameters: queryParameters,
                  ),
                  body: body,
                  headers: headers,
                )
                    .timeout(const Duration(seconds: 40), onTimeout: () {
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
                response = await http
                    .patch(
                  makePath(
                    webMethod: webMethod,
                    webController: webController,
                    optionalController: optionalWebMethod,
                    pathVariable: pathVariable,
                    queryParameters: queryParameters,
                  ),
                  body: body,
                  headers: headers,
                )
                    .timeout(const Duration(seconds: 40), onTimeout: () {
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
                response = await http
                    .get(
                  makePath(
                    webMethod: webMethod,
                    webController: webController,
                    optionalController: optionalWebMethod,
                    pathVariable: pathVariable,
                    queryParameters: queryParameters,
                  ),
                  headers: headers,
                )
                    .timeout(const Duration(seconds: 40), onTimeout: () {
                  return http.Response('Request time out', 600);
                });
              } catch (e) {
                print(e);
              }
              break;
            }
        }
      }
    } on SocketException catch (_) {
      response = http.Response('Connection field', 700);
      // isTimeOut(true);
    }

    print('status Code: \n');
    print(response.statusCode);

    print('response body: \n');
    print(response.body);

    return response;
  }

  Future<http.Response> makeFileHttpRequest({
    required WebMethods webMethod,
    required WebControllers webController,
    WebControllers? optionalWebController,
    String headers = '',
    required String type,
    String? pathVariable,
    String? filePath,
    Map<String, dynamic>? queryParameters,
  }) async {
    late http.MultipartRequest request;
    late http.StreamedResponse response1;
    late http.Response response;

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
              pathVariable: pathVariable,
              queryParameters: queryParameters,
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

  static Uri makePath({
    required WebControllers webController,
    WebMethods? webMethod,
    WebControllers? optionalController,
    String? pathVariable,
    Map<String, dynamic>? queryParameters,
  }) {
    Uri requestPath;

    if (optionalController != null) {
      if (pathVariable != null) {
        if (webMethod != null) {
          if (queryParameters != null) {
            requestPath = Uri.http(
                'ruby.alirn.ir',
                '/${optionalController.name}/${webController.name}/${webMethod.name}/$pathVariable/'
                    .replaceAll('_', '-'),
                queryParameters);
          } else {
            requestPath = Uri.http(
                'ruby.alirn.ir',
                '/${optionalController.name}/${webController.name}/${webMethod.name}/$pathVariable/'
                    .replaceAll('_', '-'));
          }
        } else {
          if (queryParameters != null) {
            requestPath = Uri.http(
                'ruby.alirn.ir',
                '/${optionalController.name}/${webController.name}/$pathVariable/'
                    .replaceAll('_', '-'),
                queryParameters);
          } else {
            requestPath = Uri.http(
                'ruby.alirn.ir',
                '/${optionalController.name}/${webController.name}/$pathVariable/'
                    .replaceAll('_', '-'));
          }
        }
      } else {
        if (webMethod != null) {
          if (queryParameters != null) {
            requestPath = Uri.http(
                'ruby.alirn.ir',
                '/${optionalController.name}/${webController.name}/${webMethod.name}/'
                    .replaceAll('_', '-'),
                queryParameters);
          } else {
            requestPath = Uri.http(
                'ruby.alirn.ir',
                '/${optionalController.name}/${webController.name}/${webMethod.name}/'
                    .replaceAll('_', '-'));
          }
        } else {
          if (queryParameters != null) {
            requestPath = Uri.http(
                'ruby.alirn.ir',
                '/${optionalController.name}/${webController.name}/'
                    .replaceAll('_', '-'),
                queryParameters);
          } else {
            requestPath = Uri.http(
                'ruby.alirn.ir',
                '/${optionalController.name}/${webController.name}/'
                    .replaceAll('_', '-'));
          }
        }
      }
    } else {
      if (pathVariable != null) {
        if (webMethod != null) {
          if (queryParameters != null) {
            requestPath = Uri.http(
                'ruby.alirn.ir',
                '/${webController.name}/${webMethod.name}/$pathVariable/'
                    .replaceAll('_', '-'),
                queryParameters);
          } else {
            requestPath = Uri.http(
                'ruby.alirn.ir',
                '/${webController.name}/${webMethod.name}/$pathVariable/'
                    .replaceAll('_', '-'));
          }
        } else {
          if (queryParameters != null) {
            requestPath = Uri.http(
                'ruby.alirn.ir',
                '/${webController.name}/$pathVariable/'.replaceAll('_', '-'),
                queryParameters);
          } else {
            requestPath = Uri.http('ruby.alirn.ir',
                '/${webController.name}/$pathVariable/'.replaceAll('_', '-'));
          }
        }
      } else {
        if (webMethod != null) {
          if (queryParameters != null) {
            requestPath = Uri.http(
                'ruby.alirn.ir',
                '/${webController.name}/${webMethod.name}/'
                    .replaceAll('_', '-'),
                queryParameters);
          } else {
            requestPath = Uri.http(
                'ruby.alirn.ir',
                '/${webController.name}/${webMethod.name}/'
                    .replaceAll('_', '-'));
          }
        } else {
          if (queryParameters != null) {
            requestPath = Uri.http(
                'ruby.alirn.ir',
                '/${webController.name}/'.replaceAll('_', '-'),
                queryParameters);
          } else {
            requestPath = Uri.http('ruby.alirn.ir',
                '/${webController.name}/'.replaceAll('_', '-'));
          }
        }
      }
    }

    return requestPath;

    // if (optionalController != null) {
    //   if (pathVariable is String) {
    //     if (webMethod != null) {
    //       return Uri.parse(
    //           '$baseUrl/${optionalController.name}/${webController.name}/${webMethod.name}/$pathVariable/'
    //               .replaceAll('_', '-'));
    //     } else {
    //       return Uri.parse(
    //           '$baseUrl/${optionalController.name}/${webController.name}/$pathVariable/'
    //               .replaceAll('_', '-'));
    //     }
    //   } else {
    //     if (webMethod != null) {
    //       return Uri.parse(
    //           '$baseUrl/${optionalController.name}/${webController.name}/${webMethod.name}/'
    //               .replaceAll('_', '-'));
    //     } else {
    //       return Uri.parse(
    //           '$baseUrl/${optionalController.name}/${webController.name}/'
    //               .replaceAll('_', '-'));
    //     }
    //   }
    // } else {
    //   if (pathVariable is String) {
    //     if (webMethod != null) {
    //       return Uri.parse(
    //           '$baseUrl/${webController.name}/${webMethod.name}/$pathVariable/'
    //               .replaceAll('_', '-'));
    //     } else {
    //       return Uri.parse('$baseUrl/${webController.name}/$pathVariable/'
    //           .replaceAll('_', '-'));
    //     }
    //   } else {
    //     if (webMethod != null) {
    //       return Uri.parse('$baseUrl/${webController.name}/${webMethod.name}/'
    //           .replaceAll('_', '-'));
    //     } else {
    //       return Uri.parse(
    //           '$baseUrl/${webController.name}/'.replaceAll('_', '-'));
    //     }
    //   }
    // }
  }
}

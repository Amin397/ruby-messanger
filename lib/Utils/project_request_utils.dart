import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:rubymessanger/Bloc/blocs.dart';

import '../Const/web_controllers.dart';
import '../Const/web_methods.dart';
import 'base_dio_request_util.dart';
import 'base_request_util.dart';

class ProjectRequestUtils extends RequestsUtil with BaseDioRequest {
  //sd

  Future<http.Response> register({
    String? userName,
    String? password,
  }) async {
    return await makeHttpRequest(
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
    return await makeHttpRequest(
        webMethod: WebMethods.login,
        webController: WebControllers.user,
        type: 'post',
        body: {
          'username': userName,
          'password': password,
        });
  }

  Future<http.Response> completeRegister({
    required String? userName,
    String? firstName,
    String? lastName,
    String? bio,
    required int gender,
  }) async {
    return await makeHttpRequest(
        webMethod: WebMethods.profile,
        webController: WebControllers.user,
        type: 'put',
        headers: {
          'Authorization': 'Bearer ${Blocs.user.accessToken}',
        },
        body: {
          'username': userName,
          'first_name': firstName,
          'last_name': lastName,
          'bio': bio,
          'is_male': (gender == 0) ? 'true' : 'false',
        });
  }

  Future<http.Response> uploadProfileImage({required String filePath}) async {
    return await makeFileHttpRequest(
      webMethod: WebMethods.picture,
      webController: WebControllers.profile,
      type: 'put',
      filePath: filePath,
      optionalWebController: WebControllers.user,
      // headers: 'Bearer ${Blocs.user.accessToken}',
      headers: 'Bearer ${Blocs.user.accessToken}',
    );
  }

  Future<http.Response> removeProfileImage() async {
    return await makeHttpRequest(
      webMethod: WebMethods.picture,
      webController: WebControllers.profile,
      optionalWebMethod: WebControllers.user,
      type: 'put',
      body: {'profile_picture': ''},
      headers: {
        'Authorization': 'Bearer ${Blocs.user.accessToken}',
      },
      // headers: 'Bearer ${Blocs.user.accessToken}',
    );
  }

  Future<http.Response> getContactData({required int userId}) async {
    return await makeHttpRequest(
      webMethod: WebMethods.profile,
      webController: WebControllers.user,
      pathVariable: '$userId',
      type: 'get',
      headers: {
        'Authorization': 'Bearer ${Blocs.user.accessToken}',
      },
    );
  }

  Future<http.Response> createPv({required int userId}) async {
    return await makeHttpRequest(
      webController: WebControllers.pv,
      pathVariable: '$userId',
      type: 'post',
      headers: {
        'Authorization': 'Bearer ${Blocs.user.accessToken}',
      },
    );
  }

  Future<http.Response> deleteAvatar() async {
    return await makeHttpRequest(
      webController: WebControllers.profile,
      optionalWebMethod: WebControllers.user,
      pathVariable: 'picture',
      type: 'put',
      body: {
        'profile_picture': '',
      },
      headers: {
        'Authorization': 'Bearer ${Blocs.user.accessToken}',
      },
    );
  }

  Future<http.Response> getMessages({
    required int pvId,
    required int limit,
    required int offset,
  }) async {
    return await makeHttpRequest(
      webMethod: WebMethods.message,
      webController: WebControllers.pv,
      queryParameters: {
        'limit': limit.toString(),
        'offset': offset.toString(),
      },
      pathVariable: '$pvId',
      type: 'get',
      headers: {
        'Authorization': 'Bearer ${Blocs.user.accessToken}',
      },
    );
  }

  Future<http.Response> sendMessage({
    required int pvId,
    required String messageText,
  }) async {
    return await makeHttpRequest(
        webMethod: WebMethods.message,
        webController: WebControllers.pv,
        type: 'post',
        headers: {
          'Authorization': 'Bearer ${Blocs.user.accessToken}',
        },
        body: {
          'text': messageText,
          'pv_id': pvId.toString(),
        });
  }

  Future<http.Response> getUserData() async {
    return await makeHttpRequest(
      webMethod: WebMethods.profile,
      webController: WebControllers.user,
      type: 'get',
      headers: {
        'Authorization': 'Bearer ${Blocs.user.accessToken}',
      },
    );
  }

  Future<http.Response> sendMobile({required String mobileNumber}) async {
    return await makeHttpRequest(
        webMethod: WebMethods.submit_phone,
        webController: WebControllers.user,
        type: 'patch',
        headers: {
          'Authorization': 'Bearer ${Blocs.user.accessToken}',
        },
        body: {
          'phone_number': mobileNumber,
        });
  }

  Future<http.Response> getChatRooms() async {
    return await makeHttpRequest(
      webMethod: WebMethods.room,
      webController: WebControllers.user,
      type: 'get',
      headers: {
        'Authorization': 'Bearer ${Blocs.user.accessToken}',
      },
    );
  }

  Future<Response> sendContacts({required List mobileNumbers}) async {
    print(mobileNumbers);
    return await makeDioRequest(
      webMethod: WebMethods.contact,
      webController: WebControllers.user,
      type: 'post',
      headers: {
        'Authorization': 'Bearer ${Blocs.user.accessToken}',
      },
      body: jsonEncode(mobileNumbers),
    );
  }

  Future<Response> deleteMessages({
    required List messagesId,
    required String pvId,
  }) async {
    messagesId.forEach((element) {
      print(element);
    });
    return await makeDioRequest(
      webController: WebControllers.pv,
      webMethod: WebMethods.message,
      type: 'post',
      pathVariable: '$pvId/delete',
      headers: {
        'Authorization': 'Bearer ${Blocs.user.accessToken}',
      },
      body: jsonEncode(messagesId),
    );
  }

  Future<http.Response> checkOtpCode({required String code}) async {
    return await makeHttpRequest(
      webMethod: WebMethods.submit_otp,
      webController: WebControllers.user,
      type: 'post',
      headers: {
        'Authorization': 'Bearer ${Blocs.user.accessToken}',
      },
      body: {
        'otp': code,
      },
    );
  }
}

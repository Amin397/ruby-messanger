import 'package:dio/dio.dart';
import '../Const/web_controllers.dart';
import '../Const/web_methods.dart';
import 'base_request_util.dart';
import 'view_utils.dart';

class BaseDioRequest {
  Future<Response> makeDioRequest({
    required WebMethods webMethod,
    required WebControllers webController,
    WebControllers? optionalWebMethod,
    String? pathVariable,
    Object body = const {},
    Map<String, String> headers = const {},
    required String type,
  }) async {
    Dio dio = Dio();
    Response dioRes;
    print('============== new request ===============send');
    print(RequestsUtil.makePath(
      webMethod: webMethod,
      pathVariable: pathVariable,
      webController: webController,
      optionalController: optionalWebMethod,
    ).toString());
    dioRes = await dio
        .post(
      RequestsUtil.makePath(
        webMethod: webMethod,
        pathVariable: pathVariable,
        webController: webController,
        optionalController: optionalWebMethod,
      ).toString(),
      data: body,
      options: Options(
        headers: headers,
      ),
    )
        .timeout(const Duration(seconds: 40), onTimeout: () {
      ViewUtils.showError(errorMessage: 'Something went wrong');
      return Response(
        requestOptions: RequestOptions(
          data: 'error',
          path: 'amin',
        ),
        statusCode: 600,
      );
    });
    print('============== new request ===============end');

    return dioRes;
  }
}

import 'package:dio/dio.dart';

class AuthInterceptor extends QueuedInterceptorsWrapper {
  final Dio dio;
  AuthInterceptor({
    required this.dio,
  });

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    print('******************** REFRESH TOKEN ********************');
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('********************');
    print('REQUEST: ${options.method} | ${options.uri}');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('********************');
    print('RESPONSE');
    return handler.next(response);
  }
}

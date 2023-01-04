import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import 'auth_interceptor.dart';

class CoreDio with DioMixin implements Dio {
  @override
  final BaseOptions options;
  CoreDio({
    required this.options,
  }) {
    interceptors.add(AuthInterceptor(dio: this));
    httpClientAdapter = DefaultHttpClientAdapter();
  }
}

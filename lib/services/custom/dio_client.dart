import 'package:dio/dio.dart';

import 'dio_custom_interceptors.dart';

class DioClient {
  static Dio get rawClient => Dio();

  static Dio request() {
    Dio dio = Dio();
    dio.interceptors.add(DioCustomInterceptors(dio: dio));
    return dio;
  }
}

final dioClient = DioClient.request();

import 'package:dio/dio.dart';
import 'package:fasta_moni_test/config/app_config.dart';
import 'package:flutter/material.dart';

class DioCustomInterceptors extends Interceptor {
  final Dio dio;
  DioCustomInterceptors({required this.dio});

//  dio instance to request token
  var tokenDio = Dio();
  var customHeaders = {
    Headers.contentTypeHeader: Headers.jsonContentType,
    'Accept': Headers.acceptHeader,
  };

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // print(accessToken);
    options.baseUrl = AppConfig.baseUrl;
    options.connectTimeout = const Duration(seconds: 25);
    options.receiveTimeout = const Duration(seconds: 30);
    // Transform response data to Json Map
    options.responseType = ResponseType.json;

    return super.onRequest(options, handler);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    // print("PATH: ${response.requestOptions.path}:: ${response.data["data"]}");
    print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    return super.onResponse(response, handler);
  }

  @override
  onError(DioException err, ErrorInterceptorHandler handler) async {
    if (CancelToken.isCancel(err)) {
      debugPrint('User cancelled the request');
    }

    return super.onError(err, handler);
  }
}

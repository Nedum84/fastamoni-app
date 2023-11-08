import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ErrorData {
  final String key;
  final String value;

  ErrorData({required this.key, required this.value});
}

class ErrorResponse {
  final String? message;
  final String? code; // Any code
  final int? statusCode;
  final List<ErrorData> errors;

  ErrorResponse({required this.message, this.errors = const [], this.statusCode, this.code});

  bool errorOccured() => (message != null && message!.isNotEmpty) || errors.isNotEmpty;
}

ErrorResponse catchErrors(error) {
  String? message = "";
  List<ErrorData> errors = [];

  if (error is DioError) {
    if (kDebugMode) {
      print(error);
    }

    if (error.response != null && error.response!.data is String) {
      return ErrorResponse(
        message: error.response!.data,
        errors: errors,
        statusCode: error.response?.statusCode,
      );
    }

    if (error.response != null && error.response?.data != null && error.response?.data?.containsKey("error")) {
      message = error.response?.data?["error"];
    } else {
      message = error.message;
    }
    if (error.response != null &&
        error.response?.data != null &&
        error.response?.data?.containsKey("errors") &&
        error.response?.data?["errors"] != null) {
      final errs = error.response?.data?["errors"] ?? [];
      for (String key in errs.keys) {
        errors.add(ErrorData(key: key, value: errs[key][0]));
      }
    }
  }

  return ErrorResponse(
    message: message,
    errors: errors,
    statusCode: error.response?.statusCode,
  );
}

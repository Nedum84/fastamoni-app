import 'package:dio/dio.dart';
import 'package:fasta_moni_test/models/user.dart';
import 'package:fasta_moni_test/services/custom/app_exceptions.dart';
import 'package:fasta_moni_test/services/custom/dio_client.dart';
import 'package:fasta_moni_test/services/custom/server_response.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  static Future<User?> findMe() async {
    const sampleUserId = '4';
    try {
      final response = await dioClient.get('/api/users/$sampleUserId');

      if (response.statusCode == 200) {
        Map<String, dynamic> user = response.data['data'];
        return User.fromMap(user);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return null;
  }

  static Future<ServerResponse<User?>> login(String email, String password) async {
    final data = {"password": password, "email": email};

    User? user;
    ErrorResponse? error;

    try {
      Response response = await dioClient.post('/api/login', data: data);

      if (response.statusCode == 200) {
        user = await findMe();
      }
    } catch (e) {
      print(e);
      error = catchErrors(e);
    }

    return ServerResponse(error: error, data: user);
  }

  static Future<ServerResponse<User?>> register(String email, String password) async {
    final data = {
      "email": email,
      "password": password,
    };

    User? user;
    ErrorResponse? error;

    try {
      Response response = await dioClient.post('/api/register', data: data);

      if (response.statusCode == 200) {
        user = await findMe();
      }
    } catch (e) {
      print(e);
      error = catchErrors(e);
    }

    return ServerResponse(error: error, data: user);
  }
}

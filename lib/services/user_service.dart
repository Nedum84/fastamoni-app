import 'package:dio/dio.dart';
import 'package:fasta_moni_test/models/user.dart';
import 'package:fasta_moni_test/services/auth_service.dart';
import 'package:fasta_moni_test/services/custom/app_exceptions.dart';
import 'package:fasta_moni_test/services/custom/dio_client.dart';
import 'package:fasta_moni_test/services/custom/server_response.dart';

class UserService {
  static Future<ServerResponse<User?>> update(String name) async {
    const sampleUserId = '4';

    final data = {
      // "job": job,
      "name": name,
    };

    User? user;
    ErrorResponse? error;

    try {
      Response response = await dioClient.patch('/api/users/$sampleUserId', data: data);

      if (response.statusCode == 200) {
        Map<String, dynamic> updated = response.data;
        final userArr = updated['name'].split(' ');

        user = await AuthService.findMe();
        user = user
          ?..firstName = userArr?[0] ?? user.firstName
          ..lastName = userArr?[1] ?? user.lastName;
      }
    } catch (e) {
      print(e);
      error = catchErrors(e);
    }

    return ServerResponse(error: error, data: user);
  }

  static Future<GetManyResponse<User>?> findAll({required int page}) async {
    try {
      final response = await dioClient.get('/api/users?page=$page');

      if (response.statusCode == 200) {
        List items = response.data['data'];

        return GetManyResponse(
          data: items.map((data) => User.fromMap(data)).toList(),
          total: response.data['total'] ?? 0,
        );
      }
    } catch (e) {
      print(e);
    }

    return null;
  }
}

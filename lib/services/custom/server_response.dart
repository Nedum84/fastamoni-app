import 'package:fasta_moni_test/services/custom/app_exceptions.dart';

class ServerResponse<T> {
  T? data;
  ErrorResponse? error;

  ServerResponse({
    required this.data,
    this.error,
  });
}

class GetManyResponse<T> {
  final List<T> data;
  final int total;

  const GetManyResponse({
    required this.data,
    required this.total,
  });
}

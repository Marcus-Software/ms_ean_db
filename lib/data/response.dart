import 'package:ms_ean_db/data/error.dart';

class Response<T> {
  Response({this.data, this.error, this.balance = 0});

  final T? data;
  final ErrorData? error;
  final int balance;

  bool get isSuccess => error == null && data != null;

  bool get isError => error != null;

  @override
  String toString() {
    return 'Response(data: $data, error: $error)';
  }
}

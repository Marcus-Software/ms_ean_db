import 'package:ms_ean_db/data/error.dart';

/// Represents a response from the EAN-DB API.
///
/// Generic class that can contain data of type [T], an error, or both.
/// Also includes the current account balance.
class Response<T> {
  /// Creates a new Response instance.
  ///
  /// [data] is the response data of type [T], if the request was successful.
  /// [error] is the error information, if the request failed.
  /// [balance] is the current account balance.
  Response({this.data, this.error, this.balance = 0});

  /// The response data of type [T], if the request was successful.
  final T? data;

  /// The error information, if the request failed.
  final ErrorData? error;

  /// The current account balance.
  final int balance;

  /// Returns true if the response was successful (has data and no error).
  bool get isSuccess => error == null && data != null;

  /// Returns true if the response contains an error.
  bool get isError => error != null;

  @override
  String toString() {
    return 'Response(balance: $balance, data: $data, error: $error)';
  }
}

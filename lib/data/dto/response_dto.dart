import 'dart:convert';

import 'package:ms_ean_db/data/dto/account_dto.dart';
import 'package:ms_ean_db/data/dto/error_dto.dart';
import 'package:ms_ean_db/data/dto/product_dto.dart';
import 'package:ms_ean_db/data/response.dart';

/// Data Transfer Object for [Response].
///
/// Extends [Response] and adds serialization/deserialization functionality.
class ResponseDto<T> extends Response<T> {
  /// Creates a new ResponseDto instance.
  ///
  /// [data] is the response data of type [T], if the request was successful.
  /// [error] is the error information, if the request failed.
  /// [balance] is the current account balance.
  ResponseDto({super.data, super.error, super.balance});

  /// Creates a ResponseDto from a map.
  ///
  /// [map] is a map containing the response data.
  ///
  /// Returns a new ResponseDto instance.
  factory ResponseDto.fromMap(Map<String, dynamic> map) {
    final error = map['error'];
    return ResponseDto<T>(
      data: _parseData<T>(map),
      error: error != null ? ErrorDto.fromMap(error) : null,
      balance: (map['balance'] ?? map['account']?['balance']) as int? ?? 0,
    );
  }

  /// Creates a ResponseDto from a JSON string.
  ///
  /// [json] is a JSON string containing the response data.
  ///
  /// Returns a new ResponseDto instance.
  factory ResponseDto.fromJson(String json) {
    return ResponseDto.fromMap(jsonDecode(json));
  }

  /// Converts this ResponseDto to a Response with a different data type.
  ///
  /// [R] is the type of data in the returned Response.
  ///
  /// Returns a new Response instance with the same data converted to type [R].
  Response<R> toResponse<R>() {
    return Response<R>(
      data: _toData<R>(data),
      error: (error as ErrorDto?)?.toErrorData(),
      balance: balance,
    );
  }

  /// Parses data from a map based on the expected type.
  ///
  /// [map] is the map containing the response data.
  ///
  /// Returns an instance of type [T] if the data can be parsed, or null otherwise.
  static T? _parseData<T>(Map<String, dynamic> map) {
    if (T == ProductDto) {
      final productData = map['product'];
      if (productData != null) {
        return ProductDto.fromMap(productData) as T;
      }
    }
    if (T == AccountDto) {
      final accountData = map['account'];
      if (accountData != null) {
        return AccountDto.fromMap(accountData) as T;
      }
    }

    return null;
  }

  /// Converts data from type [T] to type [R].
  ///
  /// [data] is the data to convert.
  ///
  /// Returns an instance of type [R] if the data can be converted, or null otherwise.
  R? _toData<R>(T? data) {
    if (data is ProductDto) {
      return data.toProduct() as R;
    }
    if (data is AccountDto) {
      return data.toAccount() as R;
    }
    if (data is R) return data;

    return null;
  }
}

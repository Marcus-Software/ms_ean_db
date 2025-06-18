import 'dart:convert';

import 'package:ms_ean_db/data/dto/account_dto.dart';
import 'package:ms_ean_db/data/dto/error_dto.dart';
import 'package:ms_ean_db/data/dto/product_dto.dart';
import 'package:ms_ean_db/data/response.dart';

class ResponseDto<T> extends Response<T> {
  ResponseDto({super.data, super.error, super.balance});

  factory ResponseDto.fromMap(Map<String, dynamic> map) {
    final error = map['error'];
    return ResponseDto<T>(
      data: _parseData<T>(map),
      error: error != null ? ErrorDto.fromMap(error) : null,
      balance: (map['balance'] ?? map['account']?['balance']) as int? ?? 0,
    );
  }

  factory ResponseDto.fromJson(String json) {
    return ResponseDto.fromMap(jsonDecode(json));
  }

  Response<R> toResponse<R>() {
    return Response<R>(
      data: _toData<R>(data),
      error: (error as ErrorDto?)?.toErrorData(),
      balance: balance,
    );
  }

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

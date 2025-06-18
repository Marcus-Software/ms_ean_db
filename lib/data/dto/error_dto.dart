import 'dart:convert';

import 'package:ms_ean_db/data/error.dart';

class ErrorDto extends ErrorData {
  ErrorDto({required super.description, required super.code});

  factory ErrorDto.fromMap(Map<String, dynamic> map) {
    return ErrorDto(
      description: map['description'] as String,
      code: map['code'] as int,
    );
  }

  factory ErrorDto.fromJson(String json) {
    final map = Map<String, dynamic>.from(jsonDecode(json));
    return ErrorDto.fromMap(map);
  }

  ErrorData toErrorData() {
    return ErrorData(description: description, code: code);
  }
}

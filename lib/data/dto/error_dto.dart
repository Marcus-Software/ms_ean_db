import 'dart:convert';

import 'package:ms_ean_db/data/error.dart';

/// Data Transfer Object for [ErrorData].
///
/// Extends [ErrorData] and adds serialization/deserialization functionality.
class ErrorDto extends ErrorData {
  /// Creates a new ErrorDto instance.
  ///
  /// [description] is a human-readable description of the error.
  /// [code] is the numeric error code.
  ErrorDto({required super.description, required super.code});

  /// Creates an ErrorDto from a map.
  ///
  /// [map] is a map containing the error data with keys 'description' and 'code'.
  ///
  /// Returns a new ErrorDto instance.
  factory ErrorDto.fromMap(Map<String, dynamic> map) {
    return ErrorDto(
      description: map['description'] as String,
      code: map['code'] as int,
    );
  }

  /// Creates an ErrorDto from a JSON string.
  ///
  /// [json] is a JSON string containing the error data.
  ///
  /// Returns a new ErrorDto instance.
  factory ErrorDto.fromJson(String json) {
    final map = Map<String, dynamic>.from(jsonDecode(json));
    return ErrorDto.fromMap(map);
  }

  /// Converts this ErrorDto to an ErrorData.
  ///
  /// Returns a new ErrorData instance with the same data.
  ErrorData toErrorData() {
    return ErrorData(description: description, code: code);
  }
}

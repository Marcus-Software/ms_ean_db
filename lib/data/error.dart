/// Represents an error returned by the EAN-DB API.
///
/// Contains information about the error, including a description and error code.
///
/// Know error codes:
/// 400: Invalid barcode supplied
/// 403: Access denied (missing or invalid JWT)
/// 404: Product not found
class ErrorData {
  /// Creates a new ErrorData instance.
  ///
  /// [description] is a human-readable description of the error.
  /// [code] is the numeric error code.
  ErrorData({required this.description, required this.code});

  /// A human-readable description of the error.
  final String description;

  /// The numeric error code.
  final int code;

  @override
  String toString() {
    return 'Error(description: $description, code: $code)';
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'code': code,
    };
  }
}

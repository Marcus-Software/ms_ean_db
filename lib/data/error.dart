class ErrorData {
  ErrorData({required this.description, required this.code});

  final String description;
  final int code;

  @override
  String toString() {
    return 'Error(description: $description, code: $code)';
  }
}

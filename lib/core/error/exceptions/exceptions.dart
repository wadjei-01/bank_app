class NetworkException implements Exception {
  NetworkException(this.message);
  final String message;

  @override
  String toString() => message;
}

class UnexpectedException implements Exception {
  UnexpectedException(this.message);
  final String message;

  @override
  String toString() => message;
}

class InvalidCredentialsException implements Exception {
  InvalidCredentialsException(this.message);
  final String message;

  @override
  String toString() => message;
}

class ApiException implements Exception {
  ApiException(this.message);
  final String message;

  @override
  String toString() => message;
}

class FileUploadException implements Exception {
  FileUploadException(this.message);
  final String message;

  @override
  String toString() => message;
}

class TokenExpiredException implements Exception {
  TokenExpiredException(this.message);
  final String message;

  @override
  String toString() => message;
}

class ClientException implements Exception {
  ClientException(this.message);
  final String message;

  @override
  String toString() => message;
}

class JsonFactoryNotFoundException implements Exception {
  JsonFactoryNotFoundException(this.message);
  final String message;

  @override
  String toString() => message;
}

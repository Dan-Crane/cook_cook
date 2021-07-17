abstract class ErrorException implements Exception {
  final String message;
  final dynamic error;

  const ErrorException([this.message = '', this.error]);
}

class SimpleException extends ErrorException {
  const SimpleException(String message, [dynamic error])
      : super(message, error);
}

class UnknownErrorException extends ErrorException {
  const UnknownErrorException(String message, [dynamic error])
      : super(message, error);
}

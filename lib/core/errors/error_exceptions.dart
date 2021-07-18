abstract class ErrorException implements Exception {
  final String? message;
  final dynamic error;

  const ErrorException([this.message, this.error]);
}

class SimpleException extends ErrorException {
  const SimpleException(String message, [dynamic error])
      : super(message, error);
}

class UnknownErrorException extends ErrorException {
  const UnknownErrorException(String message, [dynamic error])
      : super(message, error);
}

// auth exceptions
class AuthAbortException extends ErrorException {
  const AuthAbortException(String? message, [dynamic error])
      : super(message, error);
}
class UserNotFoundException extends ErrorException {
  const UserNotFoundException(String? message, [dynamic error])
      : super(message, error);
}

class EmailInUseException extends ErrorException {
  const EmailInUseException(String? message, [dynamic error])
      : super(message, error);
}

class InvalidEmailException extends ErrorException {
  const InvalidEmailException(String? message, [dynamic error])
      : super(message, error);
}

class WrongPasswordException extends ErrorException {
  const WrongPasswordException(String? message, [dynamic error])
      : super(message, error);
}

class AuthErrorException extends ErrorException {
  const AuthErrorException(String? message, [dynamic error])
      : super(message, error);
}

sealed class AppException implements Exception {
  final String message;
  const AppException(this.message);

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  const NetworkException(super.message);
}

class ServerException extends AppException {
  const ServerException(super.message);
}

class ParsingException extends AppException {
  const ParsingException(super.message);
}

class EmptyResultException extends AppException {
  const EmptyResultException([super.message = 'No results found']);
}

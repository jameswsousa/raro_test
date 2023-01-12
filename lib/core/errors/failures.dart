abstract class Failure implements Exception {
  String get title;
  String get message;
}

class ServerError extends Failure {
  @override
  final String title;
  @override
  final String message;
  ServerError({
    required this.title,
    required this.message,
  });
}

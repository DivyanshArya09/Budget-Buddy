abstract class Failure {}

class ServerFailure extends Failure {
  final String message;

  ServerFailure(this.message);
}

class CacheFailure extends Failure {
  final String message;

  CacheFailure(this.message);
}

class EmailIsBadlyFormattedFailure extends Failure {
  final String message;

  EmailIsBadlyFormattedFailure({required this.message});
}

class NetworkFailure extends Failure {
  final String message;

  NetworkFailure({required this.message});
}

class UnknownFailure extends Failure {
  final String message;

  UnknownFailure({required this.message});
}

class WeekPasswordFailure extends Failure {
  final String message;

  WeekPasswordFailure({required this.message});
}

class EmailAlreadyInUseFailure extends Failure {
  final String message;

  EmailAlreadyInUseFailure({required this.message});
}

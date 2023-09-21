sealed class Failure {}

class ApiErrorFailure extends Failure {
  final String message;
  ApiErrorFailure(this.message);
}

class ApiUnknownFailure extends Failure {
  final Exception exception;
  ApiUnknownFailure(this.exception);
}

extension ApiFailureX on Failure {
  String get errorMessage => switch (this) {
        ApiErrorFailure(message: String msg) => 'Fetching data failed. $msg',
        ApiUnknownFailure(exception: Exception e) =>
          'Something wrong happened. $e',
      };
}

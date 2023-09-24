import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {}

class ApiErrorFailure extends Failure {
  final String message;
  ApiErrorFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class ApiUnknownFailure extends Failure {
  final dynamic exception;
  ApiUnknownFailure(this.exception);

  @override
  List<Object?> get props => [exception];
}

extension ApiFailureX on Failure {
  String get errorMessage => switch (this) {
        ApiErrorFailure(message: String msg) => 'Fetching data failed. $msg',
        ApiUnknownFailure(exception: dynamic e) =>
          'Something wrong happened. $e',
      };
}

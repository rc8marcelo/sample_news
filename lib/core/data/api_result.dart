import 'package:equatable/equatable.dart';
import 'package:sample_news/core/data/failure.dart';

sealed class ApiResult<T> extends Equatable {}

class ApiResultSuccess<T> extends ApiResult<T> {
  final T data;
  ApiResultSuccess(this.data);

  @override
  List<Object?> get props => [data];
}

class ApiResultFailure<T> extends ApiResult<T> {
  final Failure failure;
  ApiResultFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}

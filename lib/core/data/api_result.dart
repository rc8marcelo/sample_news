import 'package:sample_news/core/data/api_failure.dart';

sealed class ApiResult<T> {}

class ApiResultSuccess<T> extends ApiResult<T> {
  final T data;
  ApiResultSuccess(this.data);
}

class ApiResultFailure<T> extends ApiResult<T> {
  final Failure failure;
  ApiResultFailure(this.failure);
}

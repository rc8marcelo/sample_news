import 'package:injectable/injectable.dart';
import 'package:sample_news/core/data/api_failure.dart';
import 'package:sample_news/core/data/api_result.dart';
import 'package:sample_news/features/news/data/news_client.dart';

import '../models/news_response.dart';

const _error = 'error';
const _ok = 'ok';

abstract class INewsRepo {
  Future<ApiResult<NewsApiResponse>> getHeadlines({required int page});
}

@LazySingleton(as: INewsRepo, env: [Environment.prod])
class NewsRepo implements INewsRepo {
  final NewsApiClient newsClient;
  const NewsRepo(this.newsClient);

  @override
  Future<ApiResult<NewsApiResponse>> getHeadlines({required int page}) async {
    try {
      final response = await newsClient.getHeadlines(page: page);
      if (response.status == _ok) {
        return ApiResultSuccess(response);
      } else if (response.status == _error) {
        return ApiResultFailure(ApiErrorFailure(response.message ?? ''));
      } else {
        return ApiResultFailure(
            ApiUnknownFailure(Exception('Invalid JSON response')));
      }
    } catch (e) {
      return ApiResultFailure(ApiUnknownFailure(e));
    }
  }
}

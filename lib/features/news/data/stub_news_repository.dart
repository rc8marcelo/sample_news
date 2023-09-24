import 'package:injectable/injectable.dart';
import 'package:sample_news/core/data/api_result.dart';
import 'package:sample_news/features/news/data/news_repository.dart';
import 'package:sample_news/features/news/models/news_article.dart';
import 'package:sample_news/features/news/models/news_response.dart';
import 'package:sample_news/features/news/models/news_source.dart';
import 'package:sample_news/resources/resources.dart';

@Injectable(as: INewsRepo, env: [Constants.integrationEnv])
class StubNewsRepository implements INewsRepo {
  @override
  Future<ApiResult<NewsApiResponse>> getHeadlines({required int page}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final tList = [
      NewsArticle(
        url: 'www.news.com/1',
        title: '1',
        source: const NewsSource(name: 'Google'),
        publishedAt: DateTime(2023, 12, 31),
      ),
      NewsArticle(
        url: 'www.news.com/2',
        title: '2',
        description: 'Some description',
        source: const NewsSource(name: 'Google'),
        publishedAt: DateTime(2023, 12, 31),
      ),
    ];
    final tModel = NewsApiResponse(
      totalResults: 1,
      status: 'ok',
      articles: tList,
    );
    return Future.value(ApiResultSuccess(tModel));
  }
}

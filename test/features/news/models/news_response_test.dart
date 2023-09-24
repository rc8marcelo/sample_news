import 'package:flutter_test/flutter_test.dart';
import 'package:sample_news/features/news/models/news_article.dart';
import 'package:sample_news/features/news/models/news_response.dart';
import 'package:sample_news/features/news/models/news_source.dart';

void main() {
  group('NewsApiResponse model tests: ', () {
    final tDate = DateTime(2000, 12, 31);
    test(
      '.mock() named constructor returns the right model data',
      () async {
        //* Arrange
        final tSuccessModel = NewsApiResponse(
          totalResults: 1,
          status: 'ok',
          articles: [NewsArticle.mock()],
        );
        final tFailureModel = NewsApiResponse(
          totalResults: 1,
          status: 'error',
          articles: [NewsArticle.mock()],
          message: 'Forbidden',
        );

        //* Act
        final sut = NewsApiResponse.mock(true);
        final sut2 = NewsApiResponse.mock(false);

        //* Assert
        expect(sut, tSuccessModel);
        expect(sut2, tFailureModel);
      },
    );
    test(
      '.mock() named constructor returns the right model data (with articles)',
      () async {
        //* Arrange
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

        //* Act
        final sut = NewsApiResponse.mock(true, newsArticles: tList);

        //* Assert
        expect(sut, tModel);
      },
    );
    test(
      'fromJson returns a proper model from test json data',
      () async {
        //* Arrange
        final tModel = NewsApiResponse.mock(true);
        final tJson = {
          'status': 'ok',
          'totalResults': 1,
          'articles': [
            {
              'url': 'www.google.com',
              'title': 'Some title',
              'source': {
                'name': 'Google',
              },
              'publishedAt': tDate.toString(),
            }
          ]
        };

        //* Act
        final sut = NewsApiResponse.fromJson(tJson);

        //* Assert
        expect(sut, tModel);
      },
    );
  });
}

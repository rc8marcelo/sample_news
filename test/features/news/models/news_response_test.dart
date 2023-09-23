import 'package:flutter_test/flutter_test.dart';
import 'package:sample_news/features/news/models/news_article.dart';
import 'package:sample_news/features/news/models/news_response.dart';

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

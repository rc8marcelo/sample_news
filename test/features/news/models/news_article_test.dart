import 'package:flutter_test/flutter_test.dart';
import 'package:sample_news/features/news/models/news_article.dart';
import 'package:sample_news/features/news/models/news_source.dart';
import 'package:sample_news/resources/resources.dart';

void main() {
  group('NewsArticle model tests: ', () {
    final tDate = DateTime(2000, 12, 31);
    test(
      '.mock() named constructor returns the right model data',
      () async {
        //* Arrange
        final tModel = NewsArticle(
          url: 'www.google.com',
          title: 'Some title',
          source: NewsSource.mock(),
          publishedAt: tDate,
        );

        //* Act
        final sut = NewsArticle.mock();

        //* Assert
        expect(sut, tModel);
      },
    );
    test(
      'fromJson returns a proper model from test json data',
      () async {
        //* Arrange
        final tModel = NewsArticle.mock().copyWith(
          description: 'Some description',
        );
        final tJson = {
          'url': 'www.google.com',
          'title': 'Some title',
          'source': {
            'name': 'Google',
          },
          'publishedAt': tDate.toString(),
          'description': 'Some description',
        };

        //* Act
        final sut = NewsArticle.fromJson(tJson);

        //* Assert
        expect(sut, tModel);
      },
    );

    test(
      'asLabeledText getter returns a proper LabelValueList type',
      () async {
        //* Arrange
        final tModel = NewsArticle.mock();
        final tData = [
          (label: 'Description', content: 'No data'),
          (label: 'Link', content: 'www.google.com'),
          (label: 'Source', content: 'Google'),
          (label: 'Date Published', content: 'Dec 31, 2000'),
          (label: 'Author', content: 'No data'),
        ];

        //* Act
        final sut = tModel.asLabeledText;

        //* Assert
        expect(sut, tData);
      },
    );

    test(
      'imageUrl getter returns proper url',
      () async {
        //* Arrange
        final tModelWithImg = NewsArticle.mock().copyWith(
          urlToImage: 'www.google.com/image.png',
        );
        final tModelNoImg = NewsArticle.mock();

        //* Act
        final sut1 = tModelNoImg.imageUrl;
        final sut2 = tModelWithImg.imageUrl;

        //* Assert
        expect(sut1, Constants.defaultImageUrl);
        expect(sut2, 'www.google.com/image.png');
      },
    );

    test(
      'featuredArticle getter gets the first article that has description or content',
      () async {
        //* Arrange
        final tListDesc = [
          NewsArticle.mock(),
          NewsArticle.mock(),
          NewsArticle.mock().copyWith(description: 'a'),
          NewsArticle.mock(),
        ];
        final tListContent = [
          NewsArticle.mock(),
          NewsArticle.mock().copyWith(content: 'a'),
          NewsArticle.mock(),
          NewsArticle.mock(),
        ];
        final tListBoth = [
          NewsArticle.mock().copyWith(content: 'a'),
          NewsArticle.mock(),
          NewsArticle.mock(),
          NewsArticle.mock().copyWith(description: 'a'),
        ];

        //* Act
        final sut1 = tListDesc.featuredArticle;
        final sut2 = tListContent.featuredArticle;
        final sut3 = tListBoth.featuredArticle;

        //* Assert
        expect(sut1, tListDesc[2]);
        expect(sut2, tListContent[1]);
        expect(sut3, tListBoth[0]);
      },
    );
  });
}

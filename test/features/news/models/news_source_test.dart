import 'package:flutter_test/flutter_test.dart';
import 'package:sample_news/features/news/models/news_source.dart';

void main() {
  group('NewsSource model tests: ', () {
    test(
      '.mock() named constructor returns the right model data',
      () async {
        //* Arrange
        const tModel = NewsSource(name: 'Google');

        //* Act
        final sut = NewsSource.mock();

        //* Assert
        expect(sut, tModel);
      },
    );
    test(
      'fromJson returns a proper model from test json data',
      () async {
        //* Arrange
        final tModel = NewsSource.mock();
        final tJson = {
          'name': 'Google',
        };

        //* Act
        final sut = NewsSource.fromJson(tJson);

        //* Assert
        expect(sut, tModel);
      },
    );
  });
}

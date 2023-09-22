import 'package:flutter_test/flutter_test.dart';
import 'package:sample_news/core/utils/dio_utils.dart';
import 'package:sample_news/resources/resources.dart';

void main() {
  test(
    'createDioInstance returns with proper base url',
    () async {
      //* Arrange
      final tDio = DioUtils.createDioInsteance();

      //* Act
      final baseUrl = tDio.options.baseUrl;

      //* Assert
      expect(baseUrl, Constants.baseUrl);
    },
  );
}

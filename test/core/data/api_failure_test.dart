import 'package:flutter_test/flutter_test.dart';

import 'package:sample_news/core/data/api_failure.dart';

void main() {
  group(
    'ApiFailure tests',
    () {
      test(
        'errorMessage getter returns the proper error message value',
        () async {
          //* Arrange
          final tApiFailure = ApiErrorFailure('Not found');
          final tUnknownFailure = ApiUnknownFailure(
            Exception('Test exception'),
          );

          //* Act
          final sut1 = tApiFailure.errorMessage;
          final sut2 = tUnknownFailure.errorMessage;

          //* Assert
          expect(sut1, 'Fetching data failed. Not found');
          expect(sut2, 'Something wrong happened. Exception: Test exception');
        },
      );
    },
  );
}

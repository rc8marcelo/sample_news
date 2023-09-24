import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as i;
import 'package:sample_news/core/data/failure.dart';
import 'package:sample_news/core/data/api_result.dart';
import 'package:sample_news/core/di/service_locator.dart';
import 'package:sample_news/features/news/data/news_client.dart';
import 'package:sample_news/features/news/data/news_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample_news/features/news/models/news_response.dart';

void main() {
  late INewsRepo sut;
  late NewsApiClient mockClient;

  setUpAll(() => configureDependencies(i.Environment.test));

  setUp(() {
    mockClient = serviceLocator<NewsApiClient>();
    sut = NewsRepo(mockClient);
  });

  group('NewsRepo tests: ', () {
    void mockApiResponse(NewsApiResponse model) =>
        when(() => mockClient.getHeadlines(page: any(named: 'page')))
            .thenAnswer((_) async => model);

    test(
      'Returns success with proper model when response is ok',
      () async {
        //* Arrange
        final tModel = NewsApiResponse.mock(true);
        mockApiResponse(tModel);
        final tResult = ApiResultSuccess(tModel);

        //* Act
        final result = await sut.getHeadlines(page: 1);

        //* Assert
        expect(result, tResult);
      },
    );

    test(
      'Returns error with proper failure class when response is error',
      () async {
        //* Arrange
        final tModel = NewsApiResponse.mock(false);
        mockApiResponse(tModel);
        final tResult =
            ApiResultFailure<NewsApiResponse>(ApiErrorFailure('Forbidden'));

        //* Act
        final result = await sut.getHeadlines(page: 1);

        //* Assert
        expect(result, tResult);
      },
    );
    test(
      'Returns error with proper failure class when response is error',
      () async {
        //* Arrange
        final tModel = NewsApiResponse.mock(false).copyWith(status: 'A');
        final tException = Exception('Invalid JSON response');
        final tFailure = ApiUnknownFailure(tException);
        mockApiResponse(tModel);

        //* Act
        final result = await sut.getHeadlines(page: 1);

        //* Assert
        switch (result) {
          case ApiResultSuccess<NewsApiResponse>():
            throw (Exception('Invalid case'));
          case ApiResultFailure<NewsApiResponse>():
            expect(
              result.failure.errorMessage,
              'Something wrong happened. Exception: Invalid JSON response',
            );
        }
      },
    );

    test(
      'Returns unknown failure on Exception',
      () async {
        //* Arrange
        final tException = Exception('Unknown error');
        when(() => mockClient.getHeadlines(page: any(named: 'page')))
            .thenThrow(tException);

        //* Act
        final result = await sut.getHeadlines(page: 1);

        //* Assert
        switch (result) {
          case ApiResultSuccess<NewsApiResponse>():
            throw (Exception('Invalid case'));
          case ApiResultFailure<NewsApiResponse>():
            expect(
              result.failure.errorMessage,
              'Something wrong happened. Exception: Unknown error',
            );
        }
      },
    );
  });
}

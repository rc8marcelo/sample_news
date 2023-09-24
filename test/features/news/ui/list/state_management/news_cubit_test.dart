import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as i;
import 'package:mocktail/mocktail.dart';
import 'package:sample_news/core/data/api_result.dart';
import 'package:sample_news/core/data/failure.dart';
import 'package:sample_news/core/di/service_locator.dart';
import 'package:sample_news/features/news/data/news_repository.dart';
import 'package:sample_news/features/news/models/news_response.dart';
import 'package:sample_news/features/news/ui/list/state_management/news_cubit.dart';

void main() {
  late NewsCubit sut;

  late INewsRepo mockRepository;

  setUpAll(() => configureDependencies(i.Environment.test));

  setUp(() {
    mockRepository = serviceLocator<INewsRepo>();
    sut = NewsCubit(mockRepository);
  });

  void setupMockSuccessful(NewsApiResponse mockedData) =>
      when(() => mockRepository.getHeadlines(page: any(named: 'page')))
          .thenAnswer((_) async => ApiResultSuccess(mockedData));

  void setupMockUnsuccessful(Failure failure) =>
      when(() => mockRepository.getHeadlines(page: any(named: 'page')))
          .thenAnswer((_) async => ApiResultFailure(failure));

  test(
    'NewsCubit initial state should be correct',
    () async {
      expect(sut.state, NewsState.initial());
    },
  );

  group('NewsCubit getHeadlines() tests:  ', () {
    test(
      'has correct state upon completing successful network call',
      () async {
        //* Arrange
        final tModel = NewsApiResponse.mock(true);
        final tInitialState = sut.state;
        setupMockSuccessful(tModel);

        //* Act
        await sut.getHeadlines(page: 1);
        final finalState = tInitialState.copyWith(
          isLoading: false,
          articles: tModel.articles,
          featuredArticle: tModel.articles.first,
          currentPage: 2,
        );
        //* Assert
        expect(tInitialState, NewsState.initial());
        expect(sut.state, finalState);
      },
    );
    test(
      'has correct state upon completing unsuccessful network call',
      () async {
        //* Arrange
        final tInitialState = sut.state;
        setupMockUnsuccessful(ApiErrorFailure('Not found.'));

        //* Act
        await sut.getHeadlines(page: 1);
        final finalState = tInitialState.copyWith(
          isLoading: false,
          failure: ApiErrorFailure('Not found.'),
        );
        //* Assert
        expect(tInitialState, NewsState.initial());
        expect(sut.state, finalState);
      },
    );
  });
}

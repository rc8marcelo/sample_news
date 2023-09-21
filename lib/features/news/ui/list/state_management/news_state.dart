part of 'news_cubit.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState({
    required NewsArticle? featuredArticle,
    required List<NewsArticle> articles,
    required Failure? failure,
    required int currentPage,
    required bool isLoading,
  }) = _NewsState;

  factory NewsState.initial() => const NewsState(
        articles: <NewsArticle>[],
        featuredArticle: null,
        isLoading: false,
        failure: null,
        currentPage: 0,
      );
}

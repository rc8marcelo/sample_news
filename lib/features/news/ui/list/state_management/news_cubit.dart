import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_news/core/data/api_failure.dart';
import 'package:sample_news/core/data/api_result.dart';
import 'package:sample_news/features/news/data/news_repository.dart';
import 'package:sample_news/features/news/models/news_article.dart';
import 'package:sample_news/features/news/models/news_response.dart';

part 'news_cubit.freezed.dart';
part 'news_state.dart';

@injectable
class NewsCubit extends Cubit<NewsState> {
  ///instance of news respository
  final INewsRepo _repo;

  NewsCubit(this._repo) : super(NewsState.initial());

  ///Calls the repository to get headline articles
  Future<void> getHeadlines({required int page}) async {
    emit(state.copyWith(isLoading: true));
    final nextPage = ++page;
    final result = await _repo.getHeadlines(page: nextPage);
    switch (result) {
      case ApiResultSuccess<NewsApiResponse>(data: NewsApiResponse response):
        final featuredArticle =
            state.featuredArticle ?? response.articles.featuredArticle;
        final articles =
            page == 1 ? response.articles.skip(1).toList() : response.articles;
        emit(
          state.copyWith(
            featuredArticle: featuredArticle,
            currentPage: nextPage,
            articles: articles,
            isLoading: false,
            failure: null,
          ),
        );
      case ApiResultFailure<NewsApiResponse>(failure: Failure failure):
        emit(
          state.copyWith(
            failure: failure,
            isLoading: false,
          ),
        );
    }
  }
}

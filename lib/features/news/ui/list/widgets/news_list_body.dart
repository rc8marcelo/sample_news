import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sample_news/features/common/widgets/loader.dart';
import 'package:sample_news/features/news/models/news_article.dart';
import 'package:sample_news/features/news/ui/list/state_management/news_cubit.dart';
import 'package:sample_news/features/news/ui/list/widgets/news_list_error.dart';
import 'package:sample_news/features/news/ui/list/widgets/news_list_error_item.dart';
import 'package:sample_news/features/news/ui/list/widgets/news_list_featured.dart';
import 'package:sample_news/features/news/ui/list/widgets/news_list_item.dart';

class NewsListBody extends StatefulWidget {
  const NewsListBody({super.key});

  @override
  State<NewsListBody> createState() => _NewsListBodyState();
}

class _NewsListBodyState extends State<NewsListBody> {
  late PagingController<int, NewsArticle> pagingController;

  @override
  void initState() {
    super.initState();
    pagingController = PagingController(firstPageKey: 0);
    pagingController.addPageRequestListener(
      (pageNo) => context.read<NewsCubit>().getHeadlines(page: pageNo),
    );
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewsCubit, NewsState>(
      listener: (context, state) {
        pagingController.appendPage(state.articles, state.currentPage);
      },
      listenWhen: (previous, current) => previous.articles != current.articles,
      child: RefreshIndicator(
        onRefresh: () async => pagingController.refresh(),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: NewsListFeatured(),
                ),
              ]),
            ),
            PagedSliverList<int, NewsArticle>(
              pagingController: pagingController,
              builderDelegate: PagedChildBuilderDelegate<NewsArticle>(
                itemBuilder: (context, item, index) =>
                    NewsListItem(article: item)
                        .animate(delay: 100.ms)
                        .fadeIn(duration: 600.ms, delay: 200.ms)
                        .shimmer(
                          blendMode: BlendMode.srcOver,
                          color: Colors.white12,
                        )
                        .move(
                          begin: const Offset(-16, 0),
                          curve: Curves.easeOutQuad,
                        ),
                newPageErrorIndicatorBuilder: (_) => const NewsListErrorItem(),
                noItemsFoundIndicatorBuilder: (_) => const NewsListError(),
                firstPageProgressIndicatorBuilder: (_) => const Loader(),
                newPageProgressIndicatorBuilder: (_) => const Loader(),
                transitionDuration: const Duration(milliseconds: 300),
                animateTransitions: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

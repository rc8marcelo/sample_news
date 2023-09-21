import 'package:go_router/go_router.dart';
import 'package:sample_news/core/routing/routes.dart';
import 'package:sample_news/features/news/models/news_article.dart';
import 'package:sample_news/features/news/ui/details/screen_news_details.dart';
import 'package:sample_news/features/news/ui/list/screen_news_list.dart';
import 'package:sample_news/features/profile/ui/screen_profile.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: Routes.newsList,
      builder: (context, state) => const ScreenNewsList(),
    ),
    GoRoute(
      path: Routes.newsDetails,
      builder: (context, state) {
        final article = state.extra as NewsArticle;
        return ScreenNewsDetails(article: article);
      },
    ),
    GoRoute(
      path: Routes.profile,
      builder: (context, state) => const ScreenProfile(),
    ),
  ],
);

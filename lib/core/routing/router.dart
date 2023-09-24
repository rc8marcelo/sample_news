import 'package:animations/animations.dart';
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
      pageBuilder: (context, state) {
        final article = state.extra as NewsArticle;
        return CustomTransitionPage(
          child: ScreenNewsDetails(article: article),
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SharedAxisTransition(
            transitionType: SharedAxisTransitionType.horizontal,
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          ),
        );
      },
    ),
    GoRoute(
      path: Routes.profile,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const ScreenProfile(),
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SharedAxisTransition(
          transitionType: SharedAxisTransitionType.scaled,
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
      ),
    ),
  ],
);

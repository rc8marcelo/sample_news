import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:sample_news/app.dart';
import 'package:sample_news/core/di/service_locator.dart';
import 'package:sample_news/features/news/models/news_article.dart';
import 'package:sample_news/features/news/models/news_source.dart';
import 'package:sample_news/features/news/ui/details/widgets/news_details_body.dart';
import 'package:sample_news/features/news/ui/list/widgets/news_list_featured.dart';
import 'package:sample_news/resources/resources.dart';
import 'package:patrol_finders/patrol_finders.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() => configureDependencies(Constants.integrationEnv));

  group('Integration Tests: ', () {
    patrolWidgetTest(
        'tapping on a featured widget opens the NewsDetails Screen with the right article model available',
        ($) async {
      await $.pumpWidgetAndSettle(const NewsApp());
      await $(NewsListFeatured).tap();
      final tArticle = NewsArticle(
        url: 'www.news.com/2',
        title: '2',
        description: 'Some description',
        source: const NewsSource(name: 'Google'),
        publishedAt: DateTime(2023, 12, 31),
      );

      final detailsBodyFinder = $(NewsDetailsBody);
      final detailsBody = detailsBodyFinder.tester.tester
          .widget(detailsBodyFinder) as NewsDetailsBody;
      expect(detailsBodyFinder, findsOneWidget);
      expect(detailsBody.article, tArticle);
    });
  });
}

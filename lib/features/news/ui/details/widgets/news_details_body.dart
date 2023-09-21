import 'package:flutter/material.dart';
import 'package:sample_news/features/common/widgets/custom_network_image.dart';
import 'package:sample_news/features/common/widgets/custom_tab_view.dart';
import 'package:sample_news/features/common/widgets/horizontally_padded_widget.dart';
import 'package:sample_news/features/news/models/news_article.dart';
import 'package:sample_news/features/news/ui/details/widgets/news_details_meta_data.dart';
import 'package:sample_news/features/news/ui/details/widgets/news_details_summary.dart';
import 'package:sample_news/features/news/ui/details/widgets/news_details_webview.dart';

class NewsDetailsBody extends StatelessWidget {
  final NewsArticle article;

  const NewsDetailsBody({
    required this.article,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HorizontallyPaddedWidget(
          padding: 16,
          child: CustomNetworkImage(url: article.imageUrl),
        ),
        const SizedBox(height: 8),
        HorizontallyPaddedWidget(
          padding: 16,
          child: Text(
            article.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: CustomTabView(
            tabTitles: const [
              'Summary',
              'Meta Data',
              'Web View',
              'Extra',
            ],
            children: [
              NewsDetailsSummary(
                summary: article.description,
                content: article.content,
                url: article.url,
              ),
              NewsDetailsMetaData(details: article.asLabeledText),
              NewsDetailsWebView(url: article.url),
              Text(
                'Added for scrolling purposes only',
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

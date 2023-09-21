import 'package:flutter/material.dart';
import 'package:sample_news/features/common/widgets/app_logo.dart';
import 'package:sample_news/features/news/models/news_article.dart';
import 'package:sample_news/features/news/ui/details/widgets/news_details_body.dart';

class ScreenNewsDetails extends StatelessWidget {
  final NewsArticle article;

  const ScreenNewsDetails({
    required this.article,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppLogo()),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: NewsDetailsBody(article: article),
      ),
    );
  }
}

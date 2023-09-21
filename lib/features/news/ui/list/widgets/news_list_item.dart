import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_news/core/routing/routes.dart';
import 'package:sample_news/features/common/widgets/card_with_image.dart';
import 'package:sample_news/features/common/widgets/custom_network_image.dart';
import 'package:sample_news/features/news/models/news_article.dart';

class NewsListItem extends StatelessWidget {
  final NewsArticle article;

  const NewsListItem({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return CardWithImage(
      image: CustomNetworkImage(url: article.imageUrl),
      onTap: () => context.push(Routes.newsDetails, extra: article),
      child: ListTile(
        minVerticalPadding: 12,
        title: Text(
          article.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}

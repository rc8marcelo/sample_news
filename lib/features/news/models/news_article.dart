import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:sample_news/resources/resources.dart';

import 'news_source.dart';

part 'news_article.freezed.dart';
part 'news_article.g.dart';

typedef LabelValueList = List<({String label, String content})>;

@freezed
class NewsArticle with _$NewsArticle {
  const NewsArticle._();

  factory NewsArticle({
    required String url,
    required String title,
    required NewsSource source,
    required DateTime publishedAt,
    String? description,
    String? urlToImage,
    String? content,
    String? author,
  }) = _NewsArticle;

  factory NewsArticle.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleFromJson(json);

  factory NewsArticle.mock() => NewsArticle(
        url: 'www.google.com',
        title: 'Some title',
        source: NewsSource.mock(),
        publishedAt: DateTime(2000, 12, 31),
      );

  LabelValueList get asLabeledText => [
        (label: 'Description', content: description ?? 'No data'),
        (label: 'Link', content: url),
        (label: 'Source', content: source.name),
        (
          label: 'Date Published',
          content:
              DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(publishedAt)
        ),
        (label: 'Author', content: author ?? 'No data'),
      ];

  String get imageUrl => urlToImage ?? Constants.defaultImageUrl;
}

extension NewsArticleListX on List<NewsArticle> {
  NewsArticle get featuredArticle => firstWhere(
        (element) => element.description != null || element.content != null,
        orElse: () => first,
      );
}

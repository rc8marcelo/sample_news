import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

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

  String get imageUrl =>
      urlToImage ??
      'https://static.vecteezy.com/system/resources/thumbnails/006/299/370/original/world-breaking-news-digital-earth-hud-rotating-globe-rotating-free-video.jpg';
}

extension NewsArticleListX on List<NewsArticle> {
  NewsArticle get featuredArticle => firstWhere(
        (element) => element.description != null || element.content != null,
        orElse: () => first,
      );
}

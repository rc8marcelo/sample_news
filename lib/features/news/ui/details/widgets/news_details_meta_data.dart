import 'package:flutter/widgets.dart';
import 'package:sample_news/features/common/widgets/labeled_text.dart';
import 'package:sample_news/features/news/models/news_article.dart';

class NewsDetailsMetaData extends StatelessWidget {
  final LabelValueList details;

  const NewsDetailsMetaData({
    required this.details,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: details
              .map((e) => LabeledText(
                    label: e.label,
                    content: e.content,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

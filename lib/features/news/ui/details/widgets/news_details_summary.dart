import 'package:flutter/material.dart';
import 'package:sample_news/features/common/widgets/horizontally_padded_widget.dart';
import 'package:sample_news/resources/resources.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsSummary extends StatelessWidget {
  final String? summary;
  final String? content;
  final String url;
  const NewsDetailsSummary({
    required this.summary,
    required this.content,
    required this.url,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HorizontallyPaddedWidget(
      padding: 16,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (summary == null && content == null)
              Text(
                'Oops, look like this article has no summary or text content 😅',
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
            if (summary != null)
              Text(
                summary!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            const SizedBox(height: 12),
            if (content != null)
              Text(
                content!,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () async {
                final uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) {
                  launchUrl(uri);
                }
              },
              child: Text(
                'Read more',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .withColor(Theme.of(context).colorScheme.secondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

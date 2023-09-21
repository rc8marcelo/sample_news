import 'package:flutter/material.dart';
import 'package:sample_news/resources/resources.dart';

class LabeledText extends StatelessWidget {
  final String label;
  final String? content;

  const LabeledText({
    required this.label,
    this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              '$label: ',
              style: Theme.of(context).textTheme.bodyMedium!.semibold,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              content ?? 'No data',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sample_news/resources/resources.dart';

class AppLogo extends StatelessWidget {
  final bool isLarge;

  const AppLogo({
    this.isLarge = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.now_widgets_rounded,
          color: Theme.of(context).primaryColor,
          size: isLarge ? 72 : null,
        ),
        Text(
          Strings.appName,
          style: isLarge
              ? Theme.of(context).textTheme.displayMedium
              : Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}

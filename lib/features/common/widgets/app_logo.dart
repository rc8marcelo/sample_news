import 'package:flutter/material.dart';
import 'package:sample_news/resources/resources.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.now_widgets_rounded,
          color: Theme.of(context).primaryColor,
        ),
        const Text(Strings.appName),
      ],
    );
  }
}

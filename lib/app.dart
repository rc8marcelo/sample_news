import 'package:flutter/material.dart';
import 'package:sample_news/core/routing/router.dart';
import 'package:sample_news/resources/resources.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      darkTheme: darkTheme,
      routerConfig: router,
      theme: lightTheme,
    );
  }
}

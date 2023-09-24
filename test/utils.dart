import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_news/resources/resources.dart';

extension WidgetTesterX on WidgetTester {
  Future<void> pumpThemedWidget({
    required Widget child,
  }) async {
    final app = MaterialApp(
      darkTheme: darkTheme,
      theme: lightTheme,
      home: child,
    );
    await pumpWidget(app);
  }
}

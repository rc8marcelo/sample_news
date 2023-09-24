import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_news/features/common/widgets/app_logo.dart';

import '../../../utils.dart';

void main() {
  group(
    'AppLogo widget tests: ',
    () {
      testWidgets(
        'has proper layout',
        (tester) async {
          const sut = AppLogo();
          await tester.pumpThemedWidget(child: sut);
          final iconFinder = find.byType(Icon);
          final textFinder = find.text('News++');
          final icon = tester.widget(iconFinder) as Icon;

          expect(iconFinder, findsOneWidget);
          expect(textFinder, findsOneWidget);
          expect(icon.icon, Icons.now_widgets_rounded);
        },
      );
      testWidgets(
        'has proper layout (isLarge)',
        (tester) async {
          const sut = AppLogo(
            isLarge: true,
          );
          await tester.pumpThemedWidget(child: sut);
          final iconFinder = find.byType(Icon);
          final textFinder = find.text('News++');
          final icon = tester.widget(iconFinder) as Icon;

          expect(iconFinder, findsOneWidget);
          expect(textFinder, findsOneWidget);
          expect(icon.icon, Icons.now_widgets_rounded);
          expect(icon.size, 72);
        },
      );
    },
  );
}

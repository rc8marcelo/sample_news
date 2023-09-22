import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_news/features/common/widgets/app_logo.dart';

void main() {
  group(
    'AppLogo widget tests: ',
    () {
      const sut = AppLogo();
      testWidgets('has proper layout', (tester) async {
        await tester.pumpWidget(sut);
        final iconFinder = find.byType(Icon);
        final textFinder = find.text('News++');
        final icon = tester.widget(iconFinder) as Icon;

        expect(iconFinder, findsOneWidget);
        expect(textFinder, findsOneWidget);
        expect(icon.icon, Icons.now_widgets_rounded);
      });
    },
  );
}

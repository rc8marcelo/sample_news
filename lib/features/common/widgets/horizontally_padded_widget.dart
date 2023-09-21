import 'package:flutter/widgets.dart';

class HorizontallyPaddedWidget extends Padding {
  HorizontallyPaddedWidget({
    required double padding,
    required Widget child,
    super.key,
  }) : super(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: child,
        );
}

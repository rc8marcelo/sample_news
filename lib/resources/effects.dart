import 'package:flutter_animate/flutter_animate.dart';

class Effects {
  const Effects._();

  static final forwardZoomFadeTransition = <Effect>[
    FadeEffect(
      begin: 0,
      end: 1,
      duration: 600.ms,
    ),
    const ScaleEffect(
      begin: ScaleEffect.defaultValue,
      end: ScaleEffect.neutralValue,
    ),
    BlurEffect(
      begin: BlurEffect.defaultValue,
      end: BlurEffect.neutralValue,
      duration: 600.ms,
    ),
  ];
}

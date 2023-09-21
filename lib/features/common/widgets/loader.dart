import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sample_news/resources/resources.dart';

class Loader extends StatelessWidget {
  final double? height;

  const Loader({
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LottieBuilder.asset(
        Assets.loaderAnimation,
        height: 100,
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sample_news/features/common/widgets/loader.dart';

class CustomNetworkImage extends StatelessWidget {
  final String url;
  final BoxFit fit;

  const CustomNetworkImage({
    required this.url,
    this.fit = BoxFit.fitWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (_, __) => const Loader(),
      imageUrl: url,
      fit: fit,
    );
  }
}

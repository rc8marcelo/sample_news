import 'package:flutter/material.dart';

class CardWithImage extends StatelessWidget {
  final Widget image;
  final Widget child;
  final VoidCallback? onTap;

  const CardWithImage({
    required this.image,
    required this.child,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {},
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              image,
              child,
            ],
          ),
        ),
      ),
    );
  }
}

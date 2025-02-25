import 'package:flutter/material.dart';

class ErrorImage extends StatelessWidget {
  const ErrorImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.no_photography_outlined,
      size: 60,
      color: Colors.redAccent,
      shadows: [Shadow(offset: Offset(2, 2))],
    );
  }
}

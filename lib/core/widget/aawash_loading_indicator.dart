

import 'package:flutter/material.dart';

class AawashLoadingIndicator extends StatelessWidget {
  final double scale;
  final Color? color;
  const AawashLoadingIndicator({
    super.key,
    this.color,
    this.scale = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.5,
      child: const CircularProgressIndicator(
        color: Colors.blue,
        semanticsLabel: "Loading",
        strokeWidth: 1,
      ),
    );
  }
}

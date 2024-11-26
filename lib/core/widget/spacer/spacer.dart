import 'package:flutter/material.dart';

class SpacerWidget extends StatelessWidget {
  final double? height;
  final double? width;
  const SpacerWidget({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 20,
      width: width,
    );
  }
}

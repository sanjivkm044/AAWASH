import 'package:flutter/widgets.dart';

class UnFocus extends StatelessWidget {
  const UnFocus({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      excludeFromSemantics: true,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}

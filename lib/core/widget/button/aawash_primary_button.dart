import 'package:aawash/core/theme/aawash_text_style.dart';
import 'package:flutter/material.dart';

class AawashPrimaryButton extends StatelessWidget {
  const AawashPrimaryButton({
    required this.text,
    this.onPressed,
    this.color,
    this.size,
    super.key,
  });

  final VoidCallback? onPressed;
  final String text;
  final Color? color;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FilledButton(
      style: ElevatedButton.styleFrom(
        minimumSize: size ?? const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        foregroundColor: theme.colorScheme.onPrimary,
        backgroundColor: color ?? theme.colorScheme.primary,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: AawashTextStyle.buttonTitle,
      ),
    );
  }
}

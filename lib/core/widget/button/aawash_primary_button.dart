import 'dart:math' as math;
import 'dart:ui';

import 'package:aawash/core/theme/aawash_text_color.dart';
import 'package:aawash/core/theme/aawash_text_style.dart';
import 'package:aawash/core/widget/aawash_loading_indicator.dart';
import 'package:flutter/material.dart';

// class AawashPrimaryButton extends StatelessWidget {
//   const AawashPrimaryButton({
//     required this.text,
//     this.onPressed,
//     this.icon,
//     this.isBusy = false,
//     this.color,
//     this.showLoadingifBusy = true,
//     this.size,
//     super.key,
//   });

//   final VoidCallback? onPressed;
//   final String text;
//   final IconData? icon;
//   final bool isBusy;
//   final Color? color;
//   final Size? size;
//   final bool showLoadingifBusy;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final Widget child;

//     if (isBusy && showLoadingifBusy) {
//       child = const AawashLoadingIndicator(
//         color: Colors.white,
//       );
//     } else {
//       child = icon != null
//           ? FilledButtonWithIconChild(
//               label: Text(text),
//               icon: Icon(
//                 icon,
//                 size: 20,
//               ),
//             )
//           : Text(text);
//     }

//     return FilledButton(
//       style: ElevatedButton.styleFrom(
//         minimumSize: size ?? const Size(double.infinity, 48),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
//         foregroundColor: theme.colorScheme.onPrimary,
//         backgroundColor: color,
//       ),
//       onPressed: onPressed == null
//           ? null
//           : () {
//               if (isBusy) return;
//               onPressed?.call();
//             },
//       child: child,
//     );
//   }
// }

// class FilledButtonWithIconChild extends StatelessWidget {
//   const FilledButtonWithIconChild({
//     required this.label,
//     required this.icon,
//     super.key,
//   });

//   final Widget label;
//   final Widget icon;

//   @override
//   Widget build(BuildContext context) {
//     const scale = 1;
//     // Adjust the gap based on the text scale factor. Start at 8, and lerp
//     // to 4 based on how large the text is.
//     final gap = scale <= 1 ? 8 : lerpDouble(8, 4, math.min(scale - 1, 1))!;

//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         Flexible(child: label),
//         SizedBox(width: gap.toDouble()),
//         icon,
//       ],
//     );
//   }
// }

class AawashPrimaryButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String title;
  final Color? color;
  final Size? size;
  final IconData? icon;
  final bool isBusy;
  final TextStyle? textstyle;
  final bool showLoadingifBusy;
  const AawashPrimaryButton({
    super.key,
    this.color,
    this.icon,
    this.isBusy = false,
    this.onPressed,
    this.showLoadingifBusy = false,
    this.size,
    this.textstyle,
    required this.title,
  });

  @override
  State<AawashPrimaryButton> createState() => _AawashPrimaryButtonState();
}

class _AawashPrimaryButtonState extends State<AawashPrimaryButton> {
  @override
  Widget build(BuildContext context) {
    final Widget child;

    return FilledButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AawashTextColor.black,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        print("FilledButton Pressed");
      },
      child: const Text(
        "CONTINUE",
        style: AawashTextStyle.buttonTitle,
      ),
    );
  }
}

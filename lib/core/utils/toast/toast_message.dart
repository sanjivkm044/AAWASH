// core/utils/toast/custom_toast.dart
import 'package:flutter/material.dart';

class ToastMessage {
  toast({
    required BuildContext context,
    required String message,
    double horizontalPadding = 16.0,
    double verticalPadding = 16.0,
    double fontSize = 14,
    Color? textColor,
    Color? bgColor,
  }) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: bgColor ?? Colors.black,
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      content: Text(
        message,
        style: TextStyle(
          fontFamily: "poppinsMedium",
          fontWeight: FontWeight.w400,
          fontSize: fontSize,
          color: textColor ?? Colors.white,
        ),
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

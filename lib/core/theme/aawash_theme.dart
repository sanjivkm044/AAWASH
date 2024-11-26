import 'package:aawash/core/theme/aawash_text_color.dart';
import 'package:flutter/material.dart';

abstract class AawashTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AawashTextColor.backgroundColor,
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(),
      appBarTheme: const AppBarTheme(),
      iconTheme: const IconThemeData(
        color: AawashTextColor.iconBlackColor,
      ),
      bottomAppBarTheme: const BottomAppBarTheme(),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        indicatorColor: AawashTextColor.iconBlackColor,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        position: PopupMenuPosition.under,
        elevation: 0,
        shadowColor: Colors.grey,
        color: Colors.white,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: AawashTextColor.grey100),
        ),
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
    );
  }
}

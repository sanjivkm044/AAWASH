import 'package:aawash/core/theme/aawash_text_color.dart';
import 'package:flutter/material.dart';

abstract class AawashTextStyle {
  // Large Headings
  static const TextStyle headingLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  // Medium Headings
  static const TextStyle headingMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  // Small Headings
  static const TextStyle headingSmall = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

//  Title Large
  static const TextStyle titleLargeWhite = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AawashTextColor.black,
  );

// Title Medium
  static const TextStyle titleMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AawashTextColor.primaryBlack,
  );

// Title small
  static const TextStyle titleSmall = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AawashTextColor.black,
  );

  // Body Text Large
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  // Body Text Medium
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AawashTextColor.grey100,
  );

  // Body Text Small
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AawashTextColor.grey100,
  );

  // Caption
  static const TextStyle caption = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AawashTextColor.grey100,
  );

// AAWASH Title
  static const TextStyle aawashTitle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    color: AawashTextColor.primaryBlack,
  );

// AAWASH  Button Title
  static const TextStyle buttonTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AawashTextColor.white,
  );
}

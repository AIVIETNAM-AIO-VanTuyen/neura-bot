import 'package:flutter/material.dart';
import 'colors.dart';

class AppStyles {
  // Headings
  static TextStyle headingXL = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textHigh,
  );

  static TextStyle bodyLarge = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textMedium,
    height: 1.75,
  );

  static TextStyle headingSM = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500, // Medium
    color: AppColors.textHigh,
    height: 1.35,
  );

  // Buttons
  static TextStyle button = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textHigh,
  );

  // Body Texts
  static TextStyle bodyRegular = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textHigh,
  );

  static TextStyle placeholder = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textMedium,
  );

  // Helper Texts & Captions
  static TextStyle caption = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textLow,
  );

  // Card Borders & Box Shadows
  static BoxDecoration cardDecoration = BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Colors.black.withValues(alpha: 0.08), width: 1),
  );

  static BoxDecoration mainCardDecoration = BoxDecoration(
    color: AppColors.primary500,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.3),
        blurRadius: 15,
        offset: const Offset(0, 8),
      ),
    ],
  );
}

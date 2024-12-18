import 'package:flutter/material.dart';
import 'package:hikaya/app/core/utils/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        background: AppColors.background,
        surface: AppColors.surface,
        error: AppColors.error,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.textDark),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      cardTheme: CardTheme(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8),
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
    );
  }



  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: const Color(0xFF1C1C1E), // Darker background
      colorScheme: ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        background: const Color(0xFF1C1C1E), // Matching scaffold background
        surface: const Color(0xFF2C2C2E), // Slightly lighter for cards
        error: AppColors.error,
        onBackground: Colors.white,
        onSurface: Colors.white,
        // Add color for article cards in dark mode
        tertiaryContainer: const Color(0xFF3C1517), // Dark red for article cards
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1C1C1E), // Match scaffold
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      // Update Card theme for article cards
      cardTheme: CardTheme(
        color: const Color(0xFF3C1517), // Dark red for articles
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF1C1C1E), // Match scaffold
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
      // ... rest of your theme properties
    );
  }
}

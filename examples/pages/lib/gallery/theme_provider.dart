import 'package:flutter/material.dart';

/// Theme configuration for the gallery
class GalleryTheme {
  // visx-inspired color palette
  static const Color primaryDark = Color(0xFF1A1A2E);
  static const Color primaryLight = Color(0xFFF8F9FA);
  static const Color accentCoral = Color(0xFFFC8181);
  static const Color accentTeal = Color(0xFF38B2AC);
  static const Color accentPurple = Color(0xFF805AD5);
  static const Color accentBlue = Color(0xFF4299E1);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: accentTeal,
      brightness: Brightness.light,
      primary: accentTeal,
      secondary: accentCoral,
      surface: primaryLight,
      onSurface: primaryDark,
    ),
    scaffoldBackgroundColor: const Color(0xFFF7FAFC),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: primaryDark,
      elevation: 0,
      scrolledUnderElevation: 1,
    ),
    cardTheme: CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: Colors.grey.shade100,
      selectedColor: accentTeal.withAlpha(40),
      labelStyle: const TextStyle(fontSize: 13),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.shade100,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: accentTeal,
      brightness: Brightness.dark,
      primary: accentTeal,
      secondary: accentCoral,
      surface: const Color(0xFF1E1E2E),
      onSurface: Colors.white,
    ),
    scaffoldBackgroundColor: primaryDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E2E),
      foregroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 1,
    ),
    cardTheme: CardTheme(
      elevation: 0,
      color: const Color(0xFF2A2A3E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade800),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: const Color(0xFF2A2A3E),
      selectedColor: accentTeal.withAlpha(60),
      labelStyle: const TextStyle(fontSize: 13, color: Colors.white70),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF2A2A3E),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
  );
}

/// Theme mode notifier for the gallery app
class ThemeModeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  bool get isDark => _themeMode == ThemeMode.dark;
}

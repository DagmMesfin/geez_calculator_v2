import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.orange,

    // Define Custom Colors
    scaffoldBackgroundColor: const Color(0xFFF6F8F9),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFF6F8F9)),

    // Custom Color Palette
    colorScheme: const ColorScheme.light(
        primary: Color(0xFFFF9600), // Main app color
        secondary: Color(0xFF2ACA74),
        tertiary: Color(0xFFF8EDEE),
        surface: Color(0xFFEAF0F4),
        onPrimary: Colors.white, // Text color on primary buttons
        onSecondary: Colors.white,
        onSurface: Colors.black, // General text color
        onTertiary: Color(0xFFF65F69)),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.orange,

    scaffoldBackgroundColor: const Color(0xFF101113),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF101113)),

    // Custom Color Palette
    colorScheme: const ColorScheme.dark(
        primary: Color(0xFFFF9600), // Main app color
        secondary: Color(0xFF2ACA74),
        tertiary: Color(0xFF291218),
        surface: Color(0xFF1C1F22),
        onPrimary: Colors.white, // Text color on primary buttons
        onSecondary: Colors.white,
        onSurface: Colors.white, // General text color
        onTertiary: Color(0xFFF65F69)),
  );
}

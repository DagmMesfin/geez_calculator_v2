import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:geez_calculator_v2/screen/theme.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  ThemeData get currentTheme {
    if (_themeMode == ThemeMode.dark) return AppThemes.darkTheme;
    if (_themeMode == ThemeMode.light) return AppThemes.lightTheme;

    // Follow system theme
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.dark
        ? AppThemes.darkTheme
        : AppThemes.lightTheme;
  }

  void toggleTheme() {
    if (_themeMode == ThemeMode.dark) {
      _themeMode = ThemeMode.light;
    } else {
      _themeMode = ThemeMode.dark;
    }
    notifyListeners();
  }

  void setSystemTheme() {
    _themeMode = ThemeMode.system;
    notifyListeners();
  }
}

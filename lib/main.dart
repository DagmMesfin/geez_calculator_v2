import 'package:flutter/material.dart';
import 'package:geez_calculator_v2/screen/calculator/calculator.dart';
import 'package:geez_calculator_v2/screen/converter/converter_screen.dart';
import 'package:geez_calculator_v2/misc/theme.dart';
import 'package:geez_calculator_v2/state/theme_notifier.dart';
import 'package:geez_calculator_v2/state/history_provider.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HistoryProvider>(
            create: (_) => HistoryProvider()),
        ChangeNotifierProvider<ThemeNotifier>(create: (_) => ThemeNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return ScreenUtilInit(
          designSize: const Size(375, 812), // iPhone X design size
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              title: 'Geez Calculator',
              debugShowCheckedModeBanner: false,
              themeMode: themeNotifier.themeMode, // Apply system theme mode
              theme: AppThemes.lightTheme, // Light theme
              darkTheme: AppThemes.darkTheme, // Dark theme
              home: const CalculateScreen(),
            );
          },
        );
      },
    );
  }
}

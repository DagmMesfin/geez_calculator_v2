import 'package:flutter/material.dart';
import 'package:geez_calculator_v2/screen/about_me.dart';
import 'package:geez_calculator_v2/screen/calculator/calculator_panel.dart';
import 'package:geez_calculator_v2/screen/converter/converter_screen.dart';
import 'package:geez_calculator_v2/state/theme_notifier.dart';
import 'package:geez_calculator_v2/state/history_provider.dart';
import 'package:geez_calculator_v2/widgets/calbutton.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({super.key});

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  String expresso = "";
  String resulto = "";
  bool showGeezResult = false;

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    ThemeData theme = Theme.of(context);
    ColorScheme colors = theme.colorScheme;

    double _getResultFontSize(String result) {
      int length = result.length;
      if (length <= 10) {
        return 50.sp;
      } else if (length <= 15) {
        return 40.sp;
      } else if (length <= 20) {
        return 30.sp;
      } else {
        return 24.sp;
      }
    }

    double historyPanelHeight = 0.55.sh;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: colors.onSurface),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ConverterScreen()),
              );
            },
            icon: Icon(Icons.compare_arrows_rounded, size: 30.sp),
            color: colors.onSurface,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutMeScreen()),
              );
            },
            icon: Icon(Icons.info_outline, size: 30.sp),
            color: colors.onSurface,
          ),
          IconButton(
            onPressed: () {
              Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
            },
            icon: Icon(Ionicons.moon, size: 30.sp),
            color: colors.onSurface,
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: 1.sw - 33.w,
                alignment: Alignment.centerRight,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          expresso,
                          style: TextStyle(
                            fontSize: 33.sp,
                            fontFamily: "Abay",
                            color: colors.onSurface,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Container(
                          height: 40.h,
                          width: 2.w,
                          color: colors.primary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: 1.sw - 33.w,
                height: 60.h,
                alignment: Alignment.centerRight,
                child: Text(
                  resulto,
                  style: TextStyle(
                    fontSize: _getResultFontSize(resulto),
                    fontFamily: showGeezResult ? "Abay" : "Roboto",
                    color: colors.onSurface,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.history_rounded,
                              size: 45.sp,
                              color: colors.onSurface,
                            ),
                            onPressed: () {
                              Provider.of<HistoryProvider>(context,
                                      listen: false)
                                  .toggleHistory();
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 14.h),
                      CalculatorPanel(
                        onShowGeezResult: (bool value) {
                          setState(() {
                            showGeezResult = value;
                          });
                        },
                        colors: colors,
                        expresso: expresso,
                        resulto: resulto,
                        onKeyTap: (String value) {
                          setState(() {
                            expresso = value;
                          });
                        },
                        onClear: () => setState(() {
                          expresso = "";
                          resulto = "";
                        }),
                        onResult: (String value) {
                          setState(() {
                            resulto = value;
                            Provider.of<HistoryProvider>(context, listen: false)
                                .addCalculation(expresso, resulto);
                          });
                        },
                        showGeezResult: showGeezResult,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Consumer<HistoryProvider>(
            builder: (context, historyProvider, child) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                bottom: 0,
                right: historyProvider.isHistoryVisible ? 0 : -300.w,
                width: 300.w,
                height: historyPanelHeight,
                child: Container(
                  color: colors.surface,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.r),
                        color: colors.tertiary,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'History',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: colors.onSurface,
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: colors.onTertiary,
                              ),
                              onPressed: () {
                                historyProvider.clearHistory();
                              },
                              child: const Text('Clear'),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: historyProvider.history.isEmpty
                            ? Center(
                                child: Text(
                                  'No history yet',
                                  style: TextStyle(color: colors.onSurface),
                                ),
                              )
                            : ListView.builder(
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: historyProvider.history.length,
                                itemBuilder: (context, index) {
                                  final calc = historyProvider.history[index];
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.h, horizontal: 12.w),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color:
                                              colors.onSurface.withOpacity(0.2),
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          calc.expression,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: colors.onSurface,
                                          ),
                                        ),
                                        SizedBox(height: 4.h),
                                        Text(
                                          calc.result,
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                            color: colors.onSurface,
                                          ),
                                        ),
                                        Text(
                                          _formatTimestamp(calc.timestamp),
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: colors.onSurface
                                                .withOpacity(0.7),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    return '${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')} '
        '${timestamp.day}/${timestamp.month}/${timestamp.year}';
  }
}

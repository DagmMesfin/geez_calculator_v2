import 'package:flutter/material.dart';
import 'package:geez_calculator_v2/screen/about_me.dart';
import 'package:geez_calculator_v2/screen/calculator/calculator_panel.dart';
import 'package:geez_calculator_v2/screen/converter/converter_screen.dart';
import 'package:geez_calculator_v2/state/theme_notifier.dart';
import 'package:geez_calculator_v2/state/history_provider.dart';
import 'package:geez_calculator_v2/widgets/calbutton.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({super.key});

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  String expresso = "";
  String resulto = "";

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    ThemeData theme = Theme.of(context);
    ColorScheme colors = theme.colorScheme;
    Size size = MediaQuery.of(context).size;

    double _getResultFontSize(String result) {
      int length = result.length;
      if (length <= 10) {
        return 50.0; // Default font size
      } else if (length <= 15) {
        return 40.0; // Slightly smaller
      } else if (length <= 20) {
        return 30.0; // Even smaller
      } else {
        return 24.0; // Smallest size for very long results
      }
    }

    double historyPanelHeight = size.height * 0.55;

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
            icon: const Icon(Icons.compare_arrows_rounded, size: 30),
            color: colors.onSurface,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutMeScreen()),
              );
            },
            icon: const Icon(Icons.info_outline, size: 30),
            color: colors.onSurface,
          ),
          IconButton(
            onPressed: () {
              Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
            },
            icon: const Icon(Ionicons.moon, size: 30),
            color: colors.onSurface,
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: size.width - 33,
                alignment: Alignment.centerRight,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          expresso,
                          style: TextStyle(
                            fontSize: 33,
                            fontFamily: "Abay",
                            color: colors.onSurface, // Use theme color
                          ),
                        ),
                        const SizedBox(width: 2),
                        Container(
                          height: 40,
                          width: 2,
                          color: colors.primary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: size.width - 33,
                height: 60,
                alignment: Alignment.centerRight,
                child: Text(
                  resulto,
                  style: TextStyle(
                    fontSize: _getResultFontSize(resulto),
                    color: colors.onSurface, // Use theme color
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.history_rounded,
                              size: 50,
                              color: colors.onSurface, // Use theme color
                            ),
                            onPressed: () {
                              Provider.of<HistoryProvider>(context,
                                      listen: false)
                                  .toggleHistory();
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      CalculatorPanel(
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Sliding History Panel
          Consumer<HistoryProvider>(
            builder: (context, historyProvider, child) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                bottom: 0,
                right: historyProvider.isHistoryVisible ? 0 : -300,
                width: 300,
                height: historyPanelHeight,
                child: Container(
                  color: colors.surface, // Use theme surface color
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        color: colors
                            .tertiary, // Use theme tertiary color for header
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'History',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: colors.onSurface,
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: colors
                                    .onTertiary, // Use onTertiary for text
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: colors.onSurface.withOpacity(
                                              0.2), // Subtle divider
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
                                            fontSize: 14,
                                            color: colors.onSurface,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          calc.result,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: colors.onSurface,
                                          ),
                                        ),
                                        Text(
                                          _formatTimestamp(calc.timestamp),
                                          style: TextStyle(
                                            fontSize: 10,
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

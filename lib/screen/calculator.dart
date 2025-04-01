import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geez_calculator_v2/screen/calculator_panel.dart';
import 'package:geez_calculator_v2/screen/converter_screen.dart';

import 'package:geez_calculator_v2/screen/theme_notifier.dart';
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

    // Calculate the height for the history panel (less than half the screen height)
    double historyPanelHeight = size.height * 0.55; // 40% of the screen height

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ConverterScreen()),
              );
            },
            icon: Icon(Icons.compare_arrows_rounded, size: 30),
            color: colors.onSurface,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Ionicons.settings, size: 30),
            color: colors.onSurface,
          ),
        ],
      ),
      body: Stack(
        children: [
          // Main Calculator Content
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
                          style: TextStyle(fontSize: 33, fontFamily: "Abay"),
                        ),
                        SizedBox(width: 2),
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
              SizedBox(height: 10),
              Container(
                width: size.width - 33,
                alignment: Alignment.centerRight,
                child: Text(
                  resulto,
                  style: TextStyle(fontSize: 50),
                ),
              ),
              SizedBox(height: 40),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(Icons.history_rounded, size: 50),
                            onPressed: () {
                              Provider.of<HistoryProvider>(context,
                                      listen: false)
                                  .toggleHistory();
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 14),
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
                            // Add to history when result is calculated
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
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                bottom: 20,
                right: historyProvider.isHistoryVisible ? 0 : -300,
                width: 300, // Keep the original width
                height:
                    historyPanelHeight, // Set the height to 40% of screen height
                child: Container(
                  color: CupertinoColors.systemBackground,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        color: CupertinoColors.lightBackgroundGray,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'History',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              child: Text('Clear'),
                              onPressed: () {
                                historyProvider.clearHistory();
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: historyProvider.history.isEmpty
                            ? Center(child: Text('No history yet'))
                            : ListView.builder(
                                physics:
                                    AlwaysScrollableScrollPhysics(), // Ensure scrollability
                                itemCount: historyProvider.history.length,
                                itemBuilder: (context, index) {
                                  final calc = historyProvider.history[index];
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8,
                                        horizontal: 12), // Adjusted padding
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            color: CupertinoColors.separator),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          calc.expression,
                                          style: TextStyle(
                                              fontSize:
                                                  14), // Adjusted font size
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          calc.result,
                                          style: TextStyle(
                                            fontSize: 20, // Adjusted font size
                                            fontWeight: FontWeight.bold,
                                            color: CupertinoColors.black,
                                          ),
                                        ),
                                        Text(
                                          _formatTimestamp(calc.timestamp),
                                          style: TextStyle(
                                            fontSize: 10, // Adjusted font size
                                            color: CupertinoColors.systemGrey,
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

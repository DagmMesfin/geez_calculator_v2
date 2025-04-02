import 'package:flutter/material.dart';
import 'package:geez/geez.dart';
import 'package:geez_calculator_v2/screen/calculator/calculator.dart';
// import 'package:geez_calculator_v2/screen/calculator_panel.dart';
import 'package:geez_calculator_v2/screen/converter/converter_panel.dart';
import 'package:geez_calculator_v2/screen/converter/converter_panel_arab.dart';
import 'package:geez_calculator_v2/state/theme_notifier.dart';
// import 'package:geez_calculator_v2/widgets/calbutton.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  var isGeez = true;
  var geezNum = "";
  var arabNum = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    ThemeData theme = Theme.of(context);
    ColorScheme colors = theme.colorScheme;

    double _getResultFontSize(String result) {
      int length = result.length;
      if (length <= 9) {
        return 40.0; // Default font size
      } else if (length <= 12) {
        return 30.0; // Slightly smaller
      } else if (length <= 20) {
        return 25.0; // Even smaller
      } else {
        return 20.0; // Smallest size for very long results
      }
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CalculateScreen()),
              );
            },
            icon: Icon(Icons.calculate, size: 30),
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
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            width: size.width * 0.8,
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isGeez ? "ግእዝ" : "ዓረብ",
                  style: TextStyle(fontSize: 40, fontFamily: "Abay"),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          isGeez
                              ? geezNum == ""
                                  ? "አልቦ"
                                  : geezNum
                              : arabNum,
                          style: TextStyle(
                              fontSize: _getResultFontSize(isGeez
                                  ? geezNum == ""
                                      ? "አልቦ"
                                      : geezNum
                                  : arabNum),
                              fontFamily: isGeez ? "Abay" : "Inter"),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          height: 40,
                          width: 2,
                          color: colors.primary,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70,
            width: 70,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isGeez = !isGeez;
                });
                // isGeez = !isGeez;
              },
              child: Container(
                decoration: BoxDecoration(
                  color: colors.surface,
                  borderRadius: BorderRadius.circular(70),
                ),
                child: Icon(
                  Icons.compare_arrows_rounded,
                  size: 60,
                  color: colors.onSurface,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: size.width * 0.8,
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isGeez ? "ዓረብ" : "ግእዝ",
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: "Abay",
                  ),
                ),
                Text(
                  isGeez
                      ? arabNum
                      : geezNum == ""
                          ? "አልቦ"
                          : geezNum,
                  style: TextStyle(
                      fontSize: _getResultFontSize(isGeez
                          ? arabNum
                          : geezNum == ""
                              ? "አልቦ"
                              : geezNum),
                      fontFamily: isGeez ? "Inter" : "Abay"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            alignment: Alignment.bottomCenter,
            // color: Colors.amber,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                isGeez
                    ? ConverterPanel(
                        colorScheme: colors,
                        geezNum: geezNum,
                        onKeyTap: (String value) {
                          setState(() {
                            geezNum = value;
                            arabNum = value.toArabic().toString();
                          });
                        },
                      )
                    : ConverterArabPanel(
                        colorScheme: colors,
                        arabNum: arabNum,
                        onKeyTap: (String value) {
                          setState(() {
                            arabNum = value != "" ? value : "0";
                            geezNum =
                                int.parse(arabNum).toGeez(); //convert int;
                          });
                        },
                      ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

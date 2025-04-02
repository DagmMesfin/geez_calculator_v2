import 'package:flutter/material.dart';
import 'package:geez_calculator_v2/widgets/calbutton.dart';

class ConverterArabPanel extends StatelessWidget {
  final String arabNum;
  final ColorScheme colorScheme;
  final Function(String) onKeyTap;

  const ConverterArabPanel(
      {super.key,
      required this.colorScheme,
      required this.arabNum,
      required this.onKeyTap});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          // Clear button
          CalButton("C", colorScheme.onTertiary, colorScheme.tertiary, "Inter",
              () {
            onKeyTap(""); // Reset arabNum
          }),

          Container(width: 20, height: 20),

          // Backspace button
          CalButton("<=", colorScheme.onSurface, colorScheme.surface, "Inter",
              () {
            if (arabNum.isNotEmpty) {
              onKeyTap(
                  arabNum.substring(0, arabNum.length - 1)); // Remove last char
            }
          }),
        ]),

        // Number buttons
        ..._buildNumberRows(),
      ],
    );
  }

  List<TableRow> _buildNumberRows() {
    List<List<String>> numbers = [
      ["1", "2", "3"],
      ["4", "5", "6"],
      ["7", "8", "9"],
      ["", "0", ""]
    ];

    return numbers.map((row) {
      return TableRow(
        children: row.map((num) {
          if (num.isEmpty) {
            return Container(width: 20, height: 20);
          }
          return CalButton(
              num, colorScheme.onSurface, colorScheme.surface, "Inter", () {
            onKeyTap(arabNum == "0" ? num : arabNum + num);
          }, fontsize: 33);
        }).toList(),
      );
    }).toList();
  }
}

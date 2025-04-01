import 'package:flutter/material.dart';
import 'package:geez_calculator_v2/widgets/calbutton.dart';

class ConverterPanel extends StatelessWidget {
  final String geezNum;
  final Function(String) onKeyTap;
  final ColorScheme colorScheme;

  const ConverterPanel(
      {super.key,
      required this.colorScheme,
      required this.geezNum,
      required this.onKeyTap});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          // Clear button
          CalButton(
              "C", colorScheme.onTertiary, colorScheme.tertiary, "Calibri", () {
            onKeyTap(""); // Reset geezNum
          }),

          Container(width: 20, height: 20),
          Container(width: 20, height: 20),
          Container(width: 20, height: 20),

          // Backspace button
          CalButton("<=", colorScheme.onSurface, colorScheme.surface, "Calibri",
              () {
            if (geezNum.isNotEmpty) {
              onKeyTap(
                  geezNum.substring(0, geezNum.length - 1)); // Remove last char
            }
          }),
        ]),

        // Geez number buttons
        ..._buildGeezNumberRows(),
      ],
    );
  }

  List<TableRow> _buildGeezNumberRows() {
    List<List<String>> numbers = [
      ["፸", "፹", "፺", "፻", "፼"],
      ["፳", "፴", "፵", "፶", "፷"],
      ["፮", "፯", "፰", "፱", "፲"],
      ["፩", "፪", "፫", "፬", "፭"],
    ];

    return numbers.map((row) {
      return TableRow(
        children: row.map((num) {
          return CalButton(
              num, colorScheme.onSurface, colorScheme.surface, "Abay", () {
            onKeyTap(geezNum + num);
          }, fontsize: 33);
        }).toList(),
      );
    }).toList();
  }
}

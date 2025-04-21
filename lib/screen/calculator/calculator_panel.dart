import 'package:flutter/material.dart';
import 'package:geez_calculator_v2/misc/funcs.dart';
import 'package:geez_calculator_v2/misc/fraction_utils.dart';
import 'package:geez_calculator_v2/widgets/calbutton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculatorPanel extends StatelessWidget {
  final ColorScheme colors;
  final String expresso;
  String resulto;
  final Function(String) onKeyTap;
  final Function() onClear;
  final Function(String) onResult;
  final Function(bool) onShowGeezResult;
  bool showGeezResult;

  CalculatorPanel(
      {super.key,
      required this.colors,
      required this.expresso,
      required this.resulto,
      required this.onKeyTap,
      required this.onClear,
      required this.onResult,
      required this.onShowGeezResult,
      this.showGeezResult = false});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          CalButton("C", colors.onTertiary, colors.tertiary, "Calibri", () {
            onClear(); // Reset expresso
          }),
          CalButton("(", colors.onSurface, colors.surface, "Calibri", () {
            onKeyTap(expresso + "(");
          }),
          CalButton(")", colors.onSurface, colors.surface, "Calibri", () {
            onKeyTap(expresso + ")");
          }),
          ActButton(
              "", colors.onSurface, colors.surface, "Calibri", showGeezResult,
              () {
            showGeezResult = !showGeezResult;
            onShowGeezResult(showGeezResult);
            if (expresso.isNotEmpty) {
              try {
                final result = evaluateEquation(expresso);
                final doubleValue = double.parse(result);
                final formattedResult = doubleValue % 1 == 0
                    ? doubleValue.toInt().toString()
                    : result;
                onResult(formatNumberWithFraction(formattedResult,
                    convertToGeez: showGeezResult));
              } catch (e) {
                onResult("Error");
              }
            } else {
              onResult("");
            }
          }),
          CalButton("<=", colors.onSurface, colors.surface, "Calibri", () {
            if (expresso.isNotEmpty) {
              onKeyTap(expresso.substring(
                  0, expresso.length - 1)); // Remove last char
            }
          }),
        ]),
        TableRow(children: [
          CalButton("፹", colors.onSurface, colors.surface, "Abay", () {
            onKeyTap(expresso + "፹");
          }, fontsize: 33.sp),
          CalButton("፺", colors.onSurface, colors.surface, "Abay", () {
            onKeyTap(expresso + "፺");
          }, fontsize: 33.sp),
          CalButton("፻", colors.onSurface, colors.surface, "Abay", () {
            onKeyTap(expresso + "፻");
          }, fontsize: 33.sp),
          CalButton("፼", colors.onSurface, colors.surface, "Abay", () {
            onKeyTap(expresso + "፼");
          }, fontsize: 33.sp),
          CalButton("/", colors.onPrimary, colors.primary, "Calibri", () {
            onKeyTap(expresso + "/");
          }),
        ]),
        TableRow(children: [
          CalButton("፵", colors.onSurface, colors.surface, "Abay", () {
            onKeyTap(expresso + "፵");
          }, fontsize: 33.sp),
          CalButton("፶", colors.onSurface, colors.surface, "Abay", () {
            onKeyTap(expresso + "፶");
          }, fontsize: 33.sp),
          CalButton("፷", colors.onSurface, colors.surface, "Abay", () {
            onKeyTap(expresso + "፷");
          }, fontsize: 33.sp),
          CalButton("፸", colors.onSurface, colors.surface, "Abay", () {
            onKeyTap(expresso + "፸");
          }, fontsize: 33.sp),
          CalButton("x", colors.onPrimary, colors.primary, "Calibri", () {
            onKeyTap(expresso + "*");
          }),
        ]),
        TableRow(children: [
          CalButton("፱", colors.onSurface, colors.surface, "Abay", () {
            onKeyTap(expresso + "፱");
          }, fontsize: 33.sp),
          CalButton("፲", colors.onSurface, colors.surface, "Abay", () {
            onKeyTap(expresso + "፲");
          }, fontsize: 33.sp),
          CalButton("፳", colors.onSurface, colors.surface, "Abay", () {
            onKeyTap(expresso + "፳");
          }, fontsize: 33.sp),
          CalButton("፴", colors.onSurface, colors.surface, "Abay", () {
            onKeyTap(expresso + "፴");
          }, fontsize: 33.sp),
          CalButton("-", colors.onPrimary, colors.primary, "Calibri", () {
            onKeyTap(expresso + "-");
          }),
        ]),
        TableRow(children: [
          CalButton("፭", colors.onSurface, colors.surface, "Abay", () {
            onKeyTap(expresso + "፭");
          }, fontsize: 33.sp),
          CalButton("፮", colors.onSurface, colors.surface, "Abay", () {
            onKeyTap(expresso + "፮");
          }, fontsize: 33.sp),
          CalButton("፯", colors.onSurface, colors.surface, "Abay", () {
            onKeyTap(expresso + "፯");
          }, fontsize: 33.sp),
          CalButton("፰", colors.onSurface, colors.surface, "Abay", () {
            onKeyTap(expresso + "፰");
          }, fontsize: 33.sp),
          CalButton("+", colors.onPrimary, colors.primary, "Calibri", () {
            onKeyTap(expresso + "+");
          }),
        ]),
        TableRow(children: [
          CalButton("፩", colors.onSurface, colors.surface, "Abay", () {
            onKeyTap(expresso + "፩");
          }, fontsize: 33.sp),
          CalButton("፪", colors.onSurface, colors.surface, "Abay", () {
            onKeyTap(expresso + "፪");
          }, fontsize: 33.sp),
          CalButton("፫", colors.onSurface, colors.surface, "Abay", () {
            onKeyTap(expresso + "፫");
          }, fontsize: 33.sp),
          CalButton("፬", colors.onSurface, colors.surface, "Abay", () {
            onKeyTap(expresso + "፬");
          }, fontsize: 33.sp),
          CalButton("=", colors.onPrimary, colors.primary, "Calibri", () {
            if (expresso.isNotEmpty) {
              try {
                final result = evaluateEquation(expresso);
                final doubleValue = double.parse(result);
                // Remove fractional part if it's zero
                final formattedResult = doubleValue % 1 == 0
                    ? doubleValue.toInt().toString()
                    : result;
                onResult(formatNumberWithFraction(formattedResult,
                    convertToGeez: showGeezResult));
              } catch (e) {
                onResult("Error");
              }
            } else {
              onResult("");
            }
          }),
        ]),
      ],
    );
  }
}

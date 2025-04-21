import 'package:fraction/fraction.dart';
import 'package:geez_calculator_v2/misc/geez_converter.dart';

String formatNumberWithFraction(String number, {bool convertToGeez = false}) {
  try {
    // Try to parse the number
    double value = double.parse(number);
    bool isNegative = value < 0;
    value = value.abs(); // Work with positive number

    // If the number is a whole number (no fractional part), return it as is
    if (value % 1 == 0) {
      String result =
          isNegative ? '-${value.toInt()}' : value.toInt().toString();
      return convertToGeez ? convertToGeezNum(result) : result;
    }

    // Convert to fraction first, then to mixed fraction
    Fraction fraction = Fraction.fromDouble(value);
    MixedFraction mixedFraction = MixedFraction(
      whole: fraction.numerator ~/ fraction.denominator,
      numerator: fraction.numerator % fraction.denominator,
      denominator: fraction.denominator,
    );

    // Format as mixed number with sign
    String result =
        '${isNegative ? '-' : ''}${mixedFraction.whole} ${mixedFraction.numerator}/${mixedFraction.denominator}';

    // Remove "0" and space if the mixed number starts with "0" or "-0"
    if (result.startsWith('0 ') || result.startsWith('-0 ')) {
      String sign = result.startsWith('-') ? '-' : '';
      result = sign + result.replaceFirst(RegExp(r'^-?0\s'), '');
    }

    return convertToGeez ? convertToGeezNum(result) : result;
  } catch (e) {
    // If parsing fails, return the original number
    return number;
  }
}

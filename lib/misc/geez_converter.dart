import 'package:geez/geez.dart';

String convertToGeezNum(String number) {
  try {
    bool isNegative = number.startsWith('-');
    // Remove the negative sign if present
    String numberWithoutSign = isNegative ? number.substring(1) : number;

    // Check if it's a fraction
    if (numberWithoutSign.contains('/')) {
      // Handle mixed numbers (whole number + fraction)
      if (numberWithoutSign.contains(' ')) {
        List<String> parts = numberWithoutSign.split(' ');
        String wholePart = parts[0];
        String fractionPart = parts[1];

        // Convert whole part
        String geezWhole = int.parse(wholePart).toGeez();

        // Convert fraction
        List<String> fractionParts = fractionPart.split('/');
        String numerator = fractionParts[0];
        String denominator = fractionParts[1];

        String geezNumerator = int.parse(numerator).toGeez();
        String geezDenominator = int.parse(denominator).toGeez();

        return '${isNegative ? '-' : ''}$geezWhole $geezNumerator/$geezDenominator';
      } else {
        // Handle simple fractions
        List<String> parts = numberWithoutSign.split('/');
        String numerator = parts[0];
        String denominator = parts[1];

        String geezNumerator = int.parse(numerator).toGeez();
        String geezDenominator = int.parse(denominator).toGeez();

        return '${isNegative ? '-' : ''}$geezNumerator/$geezDenominator';
      }
    } else {
      // Handle whole numbers
      return '${isNegative ? '-' : ''}${int.parse(numberWithoutSign).toGeez()}';
    }
  } catch (e) {
    // If conversion fails, return the original number
    return number;
  }
}

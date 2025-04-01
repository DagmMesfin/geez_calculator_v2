import 'dart:developer';

import 'package:geez/geez.dart';
import 'package:math_expressions/math_expressions.dart';

List<String> _numberOperationSplitter(String expression) {
  List<String> expressionArray = [];
  Set<String> operationsSet = {"+", "-", "*", "/", "(", ")"};
  String num = "";
  for (int i = 0; i < expression.length; i++) {
    if (operationsSet.contains(expression[i])) {
      if (num != "") expressionArray.add(num);
      num = "";
      expressionArray.add(expression[i]);
    } else {
      num += expression[i];
    }
  }
  if (num != "") expressionArray.add(num);
  log("${expressionArray}");
  return expressionArray;
}

String expressionReturner(String expression) {
  String result = "";
  List<String> expressionArr = _numberOperationSplitter(expression);
  Set<String> operationsSet = {"+", "-", "*", "/", "(", ")"};

  for (int i = 0; i < expressionArr.length; i++) {
    if (operationsSet.contains(expressionArr[i])) {
      result += expressionArr[i];
      continue;
    }
    result += expressionArr[i].toArabic().toString();
  }
  return result;
}

String evaluateEquation(String expression) {
  String expresso = expressionReturner(expression);
  log(expresso);
  Parser p = Parser();
  Expression exp = p.parse(expresso);
  ContextModel cm = ContextModel();

  var res = exp.evaluate(EvaluationType.REAL, cm);

  return res.toString();
}

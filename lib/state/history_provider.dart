import 'package:flutter/material.dart';
import 'package:geez_calculator_v2/model/calculator_history.dart';

class HistoryProvider with ChangeNotifier {
  List<Calculation> _history = [];
  bool _isHistoryVisible = false;

  List<Calculation> get history => _history;
  bool get isHistoryVisible => _isHistoryVisible;

  void addCalculation(String expression, String result) {
    _history.insert(
        0,
        Calculation(
          expression: expression,
          result: result,
          timestamp: DateTime.now(),
        ));
    notifyListeners();
  }

  void toggleHistory() {
    _isHistoryVisible = !_isHistoryVisible;
    notifyListeners();
  }

  void clearHistory() {
    _history.clear();
    notifyListeners();
  }
}

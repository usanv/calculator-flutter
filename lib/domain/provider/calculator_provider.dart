import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/hive/calculator_model.dart';
import 'package:flutter_application_1/domain/hive/hive_box.dart';
import 'package:flutter_application_1/domain/provider/calculator_model.dart';

class CalculatorProvider extends ChangeNotifier {
  CalculatorModel _calculatorModel = CalculatorModel();
  CalculatorModel get calculatorModel => _calculatorModel;
  bool get isFirstNumber => _isFirstNumber;
  bool _isFirstNumber = true;
  String _firstNumber = '';
  String _secondNumber = '';

  double parseNumber(String value) {
    if (value.isEmpty || value == 'null') {
      return 0;
    } else {
      return double.tryParse(value) ?? 0.0;
    }
  }

  void updateFirstNumber(String number) {
    if (_isFirstNumber) {
      _firstNumber += number;
      _calculatorModel.firstNumber = parseNumber(_firstNumber);
    } else {
      _secondNumber += number;
      _calculatorModel.secondNumber = parseNumber(_secondNumber);
    }
    notifyListeners();
  }

  void updateSeconNumber(String number) {
    if (!_isFirstNumber) {
      _secondNumber += number;
      _calculatorModel.secondNumber = parseNumber(_secondNumber);
    }
    notifyListeners();
  }

  void updateOperator(OperatorType operator) {
    _calculatorModel.currentOperator = operator;
    _calculatorModel.operatorSymbol = getOperatorSymbol(operator);
    _isFirstNumber = false;
    notifyListeners();
  }

  void performOperation(double number) {
    notifyListeners();
  }

  String getResult() {
    if (_calculatorModel.firstNumber == null ||
        _calculatorModel.secondNumber == null) {
      return 'null';
    }
    double result = 0;
    String operator = _calculatorModel.operatorSymbol ?? '';
    switch (operator) {
      case '+':
        result = (_calculatorModel.firstNumber as double) +
            (_calculatorModel.secondNumber as double);
      case '-':
        result = (_calculatorModel.firstNumber)! -
            (_calculatorModel.secondNumber as double);
      case 'x':
        result = (_calculatorModel.firstNumber as double) *
            (_calculatorModel.secondNumber as double);
      case '/':
        result = (_calculatorModel.firstNumber as double) /
            (_calculatorModel.secondNumber as double);
      case '%':
        result = ((_calculatorModel.firstNumber as double) / (100)) *
            (_calculatorModel.secondNumber as double);
    }
    _calculatorModel.result = result;
    notifyListeners();
    return result.toString();
  }

  void snappingSheetController() {
    notifyListeners();
  }

  void clear() {
    _calculatorModel.firstNumber = null;
    _calculatorModel.secondNumber = null;
    _calculatorModel.operatorSymbol = null;
    _calculatorModel.result = null;
    _isFirstNumber = true;
    _firstNumber = '';
    _secondNumber = '';
    notifyListeners();
  }

  void clearHistory(){
    HiveBox.calculator.clear();
    notifyListeners();
  }

  Future<void> addHistory() async {
    await HiveBox.calculator.add(
      HiveCalculatorModel(
        firstLength:
            '${_calculatorModel.firstNumber} ${_calculatorModel.operatorSymbol} ${_calculatorModel.secondNumber}',
        result: '${_calculatorModel.result}',
      ),
    );
  }
}

import 'package:flutter_application_1/ui/pages/calculator_page/list_operators.dart';

enum OperatorType {
  add, // [+]
  subtract, // [-]
  multiply, // [x]
  divide, // [/]
  percent, // [%]
}

String getOperatorSymbol(OperatorType operator) {
  switch (operator) {
    case OperatorType.add:
      return buttons[15];
    case OperatorType.subtract:
      return buttons[11];
    case OperatorType.multiply:
      return buttons[7];
    case OperatorType.divide:
      return buttons[3];
    case OperatorType.percent:
      return buttons[2];
    default:
      return '';
  }
}

class CalculatorModel {
  double? firstNumber;
  double? secondNumber;
  OperatorType? currentOperator;
  double? result;
  String? operatorSymbol;
}

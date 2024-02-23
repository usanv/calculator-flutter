import 'package:flutter_application_1/domain/hive/calculator_model.dart';
import 'package:hive/hive.dart';

abstract class HiveBox {
  static const String boxKey = '__CALC__';
  static final Box<HiveCalculatorModel> calculator = Hive.box<HiveCalculatorModel>(boxKey);
}
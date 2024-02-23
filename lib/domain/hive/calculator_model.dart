import 'package:hive/hive.dart';
part 'calculator_model.g.dart';

@HiveType(typeId: 0)
class HiveCalculatorModel {
  @HiveField(0)
  final String firstLength;
  @HiveField(1)
  final String result;
  const HiveCalculatorModel({
    required this.firstLength,
    required this.result,
  });
}

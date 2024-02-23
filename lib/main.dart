import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/hive/calculator_model.dart';
import 'package:flutter_application_1/domain/hive/hive_box.dart';
import 'package:flutter_application_1/ui/app.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(HiveCalculatorModelAdapter());
  await Hive.openBox<HiveCalculatorModel>(HiveBox.boxKey);

  // HiveBox.calculator.clear();
  runApp(const MyApp());
}

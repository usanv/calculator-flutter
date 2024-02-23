import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/app_routes/app_routes.dart';
import 'package:flutter_application_1/ui/pages/history_page/history_page.dart';
import 'package:flutter_application_1/ui/pages/calculator_page/calculator_page.dart';

abstract class AppNavigator {
  static String get initialRoute => AppRotes.calculatorPage;
  static Map<String, WidgetBuilder> get routes => {
        AppRotes.historyPage: (context) => const HistoryPage(),
        AppRotes.calculatorPage: (context) => const CalculatorPage(),
      };
}

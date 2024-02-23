import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/provider/calculator_provider.dart';
import 'package:flutter_application_1/domain/provider/theme_provider.dart';
import 'package:flutter_application_1/ui/app_routes/app_navigator.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CalculatorProvider>(
          create: (context) => CalculatorProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: AppNavigator.initialRoute,
        routes: AppNavigator.routes,
      ),
    );
  }
}

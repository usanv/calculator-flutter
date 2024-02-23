import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/hive/calculator_model.dart';
import 'package:flutter_application_1/domain/hive/hive_box.dart';
import 'package:flutter_application_1/domain/provider/calculator_model.dart';
import 'package:flutter_application_1/domain/provider/calculator_provider.dart';
import 'package:flutter_application_1/domain/provider/theme_provider.dart';
import 'package:flutter_application_1/ui/theme/app_colors.dart';
import 'package:flutter_application_1/ui/theme/app_text_styles.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HistoryData extends StatelessWidget {
  const HistoryData({super.key});

  // ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final calculatorProvider = Provider.of<CalculatorProvider>(context);
    final calculatorModels = calculatorProvider.calculatorModel;
    final history = HiveBox.calculator.values.toList();
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkTheme = themeProvider.isDarkTheme;
    return Container(
      color: isDarkTheme ? AppColors.dark : AppColors.light,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            HistoryThemeChangeButton(isDarkTheme: isDarkTheme),
            HistoryList(history: history),
            const SizedBox(height: 20),
            HistoryRealTimeOperation(
                calculatorModels: calculatorModels, isDarkTheme: isDarkTheme),
            HistoryRealTimeResult(
                calculatorModels: calculatorModels, isDarkTheme: isDarkTheme),
          ],
        ),
      ),
    );
  }
}

class HistoryThemeChangeButton extends StatelessWidget {
  const HistoryThemeChangeButton({
    super.key,
    required this.isDarkTheme,
  });

  final bool isDarkTheme;
  

  @override
  Widget build(BuildContext context) {
        final calculatorProvider = Provider.of<CalculatorProvider>(context);
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: ZoomTapAnimation(
            onTap: () => Provider.of<ThemeProvider>(context, listen: false)
                .toggleTheme(),
            child: Container(
              width: 26,
              height: 26,
              child: isDarkTheme
                  ? const Icon(Icons.sunny, color: AppColors.light)
                  : const Icon(
                      Icons.wb_sunny_outlined,
                      color: AppColors.dark,
                    ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: ZoomTapAnimation(
            onTap: (){
              calculatorProvider.clearHistory();
            },
            child: Container(
              width: 26,
              height: 26,
              child: isDarkTheme
                  ? const Icon(Icons.delete, color: AppColors.light)
                  : const Icon(
                      Icons.delete_outline_outlined,
                      color: AppColors.dark,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}

class HistoryRealTimeResult extends StatelessWidget {
  const HistoryRealTimeResult({
    super.key,
    required this.calculatorModels,
    required this.isDarkTheme,
  });

  final CalculatorModel calculatorModels;
  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          calculatorModels.result == null ? '' : '=',
          style: TextStyle(
            fontSize: 36,
            height: 50 / 36,
            color: isDarkTheme ? AppColors.light : AppColors.dark,
          ),
        ),
        Text(
          '${calculatorModels.result ?? ''}',
          style: TextStyle(
            fontSize: 36,
            height: 50 / 36,
            color: isDarkTheme ? AppColors.light : AppColors.dark,
          ),
        ),
      ],
    );
  }
}

class HistoryRealTimeOperation extends StatelessWidget {
  const HistoryRealTimeOperation({
    super.key,
    required this.calculatorModels,
    required this.isDarkTheme,
  });

  final CalculatorModel calculatorModels;
  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "${calculatorModels.firstNumber ?? ''} ${calculatorModels.operatorSymbol ?? ''} ${calculatorModels.secondNumber ?? ''}",
          style: TextStyle(
            fontSize: 36,
            height: 50 / 36,
            color: isDarkTheme ? AppColors.light : AppColors.dark,
          ),
        ),
      ],
    );
  }
}

class HistoryList extends StatelessWidget {
  const HistoryList({
    super.key,
    required this.history,
  });

  final List<HiveCalculatorModel> history;

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) {
      // If the history list is empty, show a message indicating no data
      return Center(
        child: Text(
          'No History',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      );
    } else {
      // If there are items in the history list, show the list of history items
      return Flexible(
        child: ListView.builder(
          // controller: _scrollController,
          itemCount: history.length,
          itemBuilder: (context, index) {
            final element = history[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  element.firstLength,
                  style: AppTextStyles.historyTexstStyle,
                ),
                Text(
                  '= ${element.result}',
                  style: AppTextStyles.historyTexstStyle,
                ),
              ],
            );
          },
        ),
      );
    }
  }
}

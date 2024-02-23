import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/provider/calculator_model.dart';
import 'package:flutter_application_1/domain/provider/calculator_provider.dart';
import 'package:flutter_application_1/domain/provider/theme_provider.dart';
import 'package:flutter_application_1/ui/pages/calculator_page/list_operators.dart';
import 'package:flutter_application_1/ui/pages/history_page/history_page.dart';
import 'package:flutter_application_1/ui/pages/calculator_page/button.dart';
import 'package:flutter_application_1/ui/theme/app_colors.dart';
import 'package:provider/provider.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkTheme = themeProvider.isDarkTheme;
    return Scaffold(
      backgroundColor:
          isDarkTheme ? AppColors.dark : AppColors.light,
      body: CalculatorPageBody(),
    );
  }
}

class CalculatorPageBody extends StatelessWidget {
  final bool isdarkTheme;
  const CalculatorPageBody({super.key, this.isdarkTheme = true});

  @override
  Widget build(BuildContext context) {
    final calculatorProvider = Provider.of<CalculatorProvider>(context);
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Button(
                  buttonFunction: () {
                    calculatorProvider.clear();
                  },
                  buttonText: buttons[0],
                ),
                Button(
                  buttonFunction: () {},
                  buttonText: buttons[1],
                ),
                Button(
                  buttonFunction: () {
                    calculatorProvider.updateOperator(OperatorType.percent);
                  },
                  buttonText: buttons[2],
                ),
                Button(
                  buttonFunction: () {
                    calculatorProvider.updateOperator(OperatorType.divide);
                  },
                  buttonText: buttons[3],
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Button(
                  buttonFunction: () {
                    if (calculatorProvider.isFirstNumber) {
                      calculatorProvider.updateFirstNumber(buttons[4]);
                    } else {
                      calculatorProvider.updateSeconNumber(buttons[4]);
                    }
                  },
                  buttonText: buttons[4],
                  isButtonColor: true,
                ),
                Button(
                  buttonFunction: () {
                    if (calculatorProvider.isFirstNumber) {
                      calculatorProvider.updateFirstNumber(buttons[5]);
                    } else {
                      calculatorProvider.updateSeconNumber(buttons[5]);
                    }
                  },
                  buttonText: buttons[5],
                  isButtonColor: true,
                ),
                Button(
                  buttonFunction: () {
                    if (calculatorProvider.isFirstNumber) {
                      calculatorProvider.updateFirstNumber(buttons[6]);
                    } else {
                      calculatorProvider.updateSeconNumber(buttons[6]);
                    }
                  },
                  buttonText: buttons[6],
                  isButtonColor: true,
                ),
                Button(
                  buttonFunction: () {
                    calculatorProvider.updateOperator(OperatorType.multiply);
                  },
                  buttonText: buttons[7],
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Button(
                  buttonFunction: () {
                    if (calculatorProvider.isFirstNumber) {
                      calculatorProvider.updateFirstNumber(buttons[8]);
                    } else {
                      calculatorProvider.updateSeconNumber(buttons[8]);
                    }
                  },
                  buttonText: buttons[8],
                  isButtonColor: true,
                ),
                Button(
                  buttonFunction: () {
                    if (calculatorProvider.isFirstNumber) {
                      calculatorProvider.updateFirstNumber(buttons[9]);
                    } else {
                      calculatorProvider.updateSeconNumber(buttons[9]);
                    }
                  },
                  buttonText: buttons[9],
                  isButtonColor: true,
                ),
                Button(
                  buttonFunction: () {
                    if (calculatorProvider.isFirstNumber) {
                      calculatorProvider.updateFirstNumber(buttons[10]);
                    } else {
                      calculatorProvider.updateSeconNumber(buttons[10]);
                    }
                  },
                  buttonText: buttons[10],
                  isButtonColor: true,
                ),
                Button(
                  buttonFunction: () {
                    calculatorProvider.updateOperator(OperatorType.subtract);
                  },
                  buttonText: buttons[11],
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Button(
                  buttonFunction: () {
                    if (calculatorProvider.isFirstNumber) {
                      calculatorProvider.updateFirstNumber(buttons[12]);
                    } else {
                      calculatorProvider.updateSeconNumber(buttons[12]);
                    }
                  },
                  buttonText: buttons[12],
                  isButtonColor: true,
                ),
                Button(
                  buttonFunction: () {
                    if (calculatorProvider.isFirstNumber) {
                      calculatorProvider.updateFirstNumber(buttons[13]);
                    } else {
                      calculatorProvider.updateSeconNumber(buttons[13]);
                    }
                  },
                  buttonText: buttons[13],
                  isButtonColor: true,
                ),
                Button(
                  buttonFunction: () {
                    if (calculatorProvider.isFirstNumber) {
                      calculatorProvider.updateFirstNumber(buttons[14]);
                    } else {
                      calculatorProvider.updateSeconNumber(buttons[14]);
                    }
                  },
                  buttonText: buttons[14],
                  isButtonColor: true,
                ),
                Button(
                  buttonFunction: () {
                    calculatorProvider.updateOperator(OperatorType.add);
                  },
                  buttonText: buttons[15],
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Button(
                  buttonFunction: () {
                    if (calculatorProvider.isFirstNumber) {
                      calculatorProvider.updateFirstNumber(buttons[16]);
                    } else {
                      calculatorProvider.updateSeconNumber(buttons[16]);
                    }
                  },
                  buttonText: buttons[16],
                  isButtonColor: true,
                ),
                Button(
                  buttonFunction: () {
                    if (calculatorProvider.isFirstNumber) {
                      print(buttons[17]);
                      calculatorProvider.updateFirstNumber(buttons[17]);
                    } else {
                      calculatorProvider.updateSeconNumber(buttons[17]);
                    }
                  },
                  buttonText: buttons[17],
                  isButtonColor: true,
                ),
                Button(
                  buttonFunction: () {
                    String result = calculatorProvider.getResult();
                    if (result != 'null') {
                      calculatorProvider.addHistory();
                    }
                  },
                  buttonText: buttons[18],
                  isButtonColor: true,
                  isEqualbtn: true,
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
        const Positioned.fill(
          child: HistoryPage(),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/theme/app_colors.dart';

class Button extends StatelessWidget {
  final bool isButtonColor;
  final String buttonText;
  final Function buttonFunction;
  final bool isEqualbtn;
  const Button({
    super.key,
    this.isButtonColor = false,
    required this.buttonText,
    required this.buttonFunction,
    this.isEqualbtn = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isEqualbtn ? 180 : 85,
      height: 85,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0.6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: isButtonColor ? AppColors.light : AppColors.dark,
        ),
        onPressed: () {
          buttonFunction();
        },
        child: Text(
          buttonText,
          style: TextStyle(
            color: isButtonColor ? AppColors.dark : AppColors.light,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

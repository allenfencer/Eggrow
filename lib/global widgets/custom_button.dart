import 'package:flutter/material.dart';

import '../constants/text_theme.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color? buttonColor;
  final bool isLoading;
  final VoidCallback function;
  const CustomButton(
      {super.key,
      this.buttonColor,
      required this.isLoading,
      required this.function,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: function,
        style: TextButton.styleFrom(
          fixedSize: const Size(double.maxFinite, 50),
          backgroundColor: buttonColor?? TT.primaryBlack,
        ),
        child: isLoading
            ? const Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: TT.lightPurple,
                    strokeWidth: 3,
                  ),
                ),
              )
            : Text(buttonText, style: TT.f18w600));
  }
}

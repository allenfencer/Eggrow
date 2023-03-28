import 'package:flutter/material.dart';

import '../constants/text_theme.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final bool isLoading;
  final VoidCallback function;
  const CustomButton(
      {super.key,
      required this.isLoading,
      required this.function,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: function,
        style: TextButton.styleFrom(
          fixedSize: const Size(120, 40),
          backgroundColor: TT.primaryBlack,
        ),
        child: isLoading
            ? const Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: TT.primaryPeach,
                    strokeWidth: 3,
                  ),
                ),
              )
            : Text(buttonText, style: TT.f18w600));
  }
}

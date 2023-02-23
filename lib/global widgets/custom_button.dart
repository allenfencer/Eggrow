import 'package:flutter/material.dart';

import '../constants/text_theme.dart';

class CustomButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback function;
  const CustomButton(
      {super.key, required this.isLoading, required this.function});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: function,
        style: TextButton.styleFrom(
          fixedSize: const Size(180, 50),
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
            : const Text('Login', style: TT.f18w600));
  }
}

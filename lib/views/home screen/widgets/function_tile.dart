import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

import '../../../constants/text_theme.dart';

class FunctionTile extends StatelessWidget {
  final Color textColor;
  final String tileName;
  final Color bgColor;
  final Widget route;
  final String imagePath;
  const FunctionTile(
      {super.key,
      required this.textColor,
      required this.bgColor,
      required this.imagePath,
      required this.route,
      required this.tileName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var type = FeedbackType.heavy;
        Vibrate.feedback(type);
        showDialog(
            context: context,
            barrierDismissible: true,
            builder: ((context) {
              return Dialog.fullscreen(
                  backgroundColor: Colors.transparent, child: route);
            }));
      },
      child: Container(
        height: 180,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          color: bgColor,
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(5, 5),
                color: Colors.grey.shade400.withOpacity(0.7))
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(imagePath),
            const SizedBox(
              height: 20,
            ),
            Text(
              tileName,
              style: TT.f18w600.copyWith(color: textColor),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../constants/text_theme.dart';

class MinimalistTile extends StatelessWidget {
  final double? height;
  final double? width;
  final IconData? icon;
  final String text;
  final bool isActiv;
  final Color? color;
  final Widget? child;
  final Color? textColor;
  const MinimalistTile({
    super.key,
    this.child,
    required this.icon,
    required this.isActiv,
    required this.text,
    this.color,
    this.height,
    this.width,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: isActiv ? TT.lightPurle : Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(1, 1),
                spreadRadius: 2,
                blurStyle: BlurStyle.outer,
                blurRadius: 12)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 35,
            color: isActiv ? Colors.white : TT.primaryBlack,
          ),
          Text(
            text,
            style: isActiv
                ? TT.f18wnormal.copyWith(fontSize: 16, color: Colors.white)
                : TT.f18wnormal.copyWith(fontSize: 16),
          )
        ],
      ),
    );
  }
}

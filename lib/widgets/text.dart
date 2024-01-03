import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(
      {super.key,
      required this.text,
      required this.opacity,
      required this.fontSize,
      required this.color});
  final String text;
  final double opacity;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Text(
        text,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: 'SF UI Display',
          fontWeight: FontWeight.w800,
          height: 0,
          letterSpacing: 1.12,
        ),
      ),
    );
  }
}

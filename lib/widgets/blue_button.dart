import 'package:flutter/material.dart';

class BlueButtonWidget extends StatelessWidget {
  const BlueButtonWidget(
      {super.key, required this.text, required this.fontSize});

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width / (320 / 281),
      height: MediaQuery.sizeOf(context).height / (568 / 43),
      decoration: ShapeDecoration(
        color: const Color(0xFF4991FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        shadows: const [
          BoxShadow(
            color: Color(0x7F000000),
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Center(
        child: Text(
          text,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontFamily: 'SF UI Display',
            fontWeight: FontWeight.w800,
            height: 0,
            letterSpacing: 0.72,
          ),
        ),
      ),
    );
  }
}

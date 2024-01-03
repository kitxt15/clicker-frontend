import 'package:flutter/material.dart';

class WhiteBoxWidget extends StatelessWidget {
  const WhiteBoxWidget(
      {super.key,
      required this.child,
      required this.width,
      required this.height});
  final Widget? child;
  final double width;
  final double height;
  // mediaQuery.size.width / 1.09589041
  // mediaQuery.size.height / 2.48062016

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: Colors.white,
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
      child: child,
    );
  }
}

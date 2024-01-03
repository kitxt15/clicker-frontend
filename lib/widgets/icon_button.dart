// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class IconBtnWidget extends StatelessWidget {
  const IconBtnWidget({super.key, required this.icon});
  final String icon;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      width: mediaQuery.size.width / 6.53061224,
      height: mediaQuery.size.width / 6.53061224,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        shadows: [
          BoxShadow(
            color: Color(0x7F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Center(
        child: getIcon(icon, context),
      ),
    );
  }

  Image getIcon(String icon, BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    switch (icon) {
      case "settings":
        return Image.asset(
          "lib/assets/settings.png",
          width: mediaQuery.size.width / 6.53061224 - 17,
          height: mediaQuery.size.width / 6.53061224 - 17,
        );
      case "top":
        return Image.asset(
          "lib/assets/top.png",
          width: mediaQuery.size.width / 6.53061224 - 17,
          height: mediaQuery.size.width / 6.53061224 - 17,
        );
      case "shop":
        return Image.asset(
          "lib/assets/shop.png",
          width: mediaQuery.size.width / 6.53061224 - 17,
          height: mediaQuery.size.width / 6.53061224 - 17,
        );
      case "user":
        return Image.asset(
          "lib/assets/user.png",
          width: mediaQuery.size.width / 6.53061224 - 17,
          height: mediaQuery.size.width / 6.53061224 - 17,
        );
      case "back":
        return Image.asset(
          "lib/assets/back.png",
          width: mediaQuery.size.width / 6.53061224 - 17,
          height: mediaQuery.size.width / 6.53061224 - 17,
        );

      default:
        return Image.asset(
          "lib/assets/back.png",
          width: mediaQuery.size.width / 6.53061224 - 17,
          height: mediaQuery.size.width / 6.53061224 - 17,
        );
    }
  }
}

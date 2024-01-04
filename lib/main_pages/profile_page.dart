import 'package:flutter/material.dart';
import 'package:kvantfront/main_page.dart';
import 'package:kvantfront/widgets/blue_button.dart';
import 'package:kvantfront/widgets/icon_button.dart';
import 'package:kvantfront/widgets/text.dart';
import 'package:kvantfront/widgets/white_container.dart';

import '../main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: const Color.fromRGBO(73, 146, 255, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainPage()));
                      },
                      child: const IconBtnWidget(icon: "back")),
                ),
              ],
            ),
            WhiteBoxWidget(
                width: MediaQuery.sizeOf(context).width / (320 / 304),
                height: MediaQuery.sizeOf(context).height / (568 / 476),
                // child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height:
                          MediaQuery.sizeOf(context).height / (568 / 476) / 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          StyledText(
                              text: user.username,
                              opacity: 1,
                              fontSize: 40,
                              color: Colors.black),
                          StyledText(
                              text: user.email,
                              opacity: 0.5,
                              fontSize: 28,
                              color: Colors.black),
                          StyledText(
                              text: user.location,
                              opacity: 0.3,
                              fontSize: 25,
                              color: Colors.black)
                        ],
                      ),
                    ),
                    SizedBox(
                      height:
                          MediaQuery.sizeOf(context).height / (568 / 476) / 2,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BlueButtonWidget(
                              text: "Изменить никнейм", fontSize: 28),
                          BlueButtonWidget(
                              text: "Изменить пароль", fontSize: 28),
                          BlueButtonWidget(
                              text: "Изменить почту", fontSize: 28),
                          BlueButtonWidget(text: "Новости", fontSize: 28),
                        ],
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

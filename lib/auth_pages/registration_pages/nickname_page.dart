import 'package:flutter/material.dart';
import 'package:kvantfront/auth_pages/registration_pages/password_page.dart';
import 'package:kvantfront/auth_pages/start_page.dart';
import 'package:kvantfront/widgets/blue_button.dart';
import 'package:kvantfront/widgets/icon_button.dart';
import 'package:kvantfront/widgets/text.dart';
import 'package:kvantfront/widgets/white_container.dart';

import '../../main.dart';

void main() => runApp(const MaterialApp(
      title: "App",
      home: NicknameRegisterPageWidget(),
    ));

class NicknameRegisterPageWidget extends StatelessWidget {
  const NicknameRegisterPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Container(
          color: const Color.fromRGBO(73, 146, 255, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: WhiteBoxWidget(
                    width: MediaQuery.sizeOf(context).width / 1.14695341,
                    height: MediaQuery.sizeOf(context).width / 1.78666667,
                    child: Center(
                      child: SizedBox(
                        width:
                            MediaQuery.sizeOf(context).width / 1.14695341 / 1.5,
                        child: const StyledText(
                            text: "Добро пожаловать!",
                            opacity: 1,
                            fontSize: 32,
                            color: Colors.black),
                      ),
                    )),
              ),
              WhiteBoxWidget(
                  width: MediaQuery.sizeOf(context).width / (320 / 298),
                  height: MediaQuery.sizeOf(context).height / (568 / 345),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            height: MediaQuery.sizeOf(context).height /
                                (568 / 345) /
                                1.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const StyledText(
                                    text: "Введите желаемый никнейм:",
                                    opacity: 1,
                                    fontSize: 30,
                                    color: Colors.black),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width /
                                      (320 / 298) /
                                      1.2,
                                  child: TextField(
                                    onChanged: (value) {
                                      user.username = value;
                                    },
                                    decoration: const InputDecoration(
                                      hintText: "Писать здесь",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(14)),
                                      ),
                                    ),
                                    textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 28,
                                      fontFamily: 'SF UI Display',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                      letterSpacing: 1.12,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PasswordRegisterPageWidget()));
                                  },
                                  child: const BlueButtonWidget(
                                      text: 'Дальше', fontSize: 24),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20, left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Builder(builder: (context) {
                                return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const StartPageWidget()));
                                    },
                                    child: const IconBtnWidget(icon: "back"));
                              }),
                            ],
                          ),
                        )
                      ]))
            ],
          ),
        ),
      ),
    );
  }
}

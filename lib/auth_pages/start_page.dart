import 'package:flutter/material.dart';
import 'package:kvantfront/widgets/blue_button.dart';
import 'package:kvantfront/widgets/text.dart';
import 'package:kvantfront/widgets/white_container.dart';

import 'registration_pages/nickname_page.dart';

class StartPageWidget extends StatelessWidget {
  const StartPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const StyledText(
                        text: "Выберите вариант:",
                        opacity: 1,
                        fontSize: 30,
                        color: Colors.black),
                    SizedBox(
                      height:
                          MediaQuery.sizeOf(context).width / (320 / 298) / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const NicknameRegisterPageWidget()));
                              },
                              child: const BlueButtonWidget(
                                  text: 'Я новенький', fontSize: 24)),
                          const StyledText(
                              text: "или",
                              opacity: 1,
                              fontSize: 30,
                              color: Colors.black),
                          const BlueButtonWidget(
                              text: 'У меня уже есть аккаунт', fontSize: 24),
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

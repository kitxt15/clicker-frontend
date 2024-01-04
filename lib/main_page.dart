// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kvantfront/main.dart';
import 'package:kvantfront/main_pages/shop_page.dart';
import 'package:kvantfront/widgets/icon_button.dart';
import 'package:kvantfront/widgets/text.dart';
import 'package:kvantfront/widgets/white_container.dart';

import 'main_pages/profile_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        user.balance;
      });
    });
  }

  void incrementCounter() {
    setState(() {
      user.balance++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(73, 146, 255, 1),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const IconBtnWidget(
                      icon: "settings",
                    ),
                    const IconBtnWidget(
                      icon: "top",
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfilePage()));
                      },
                      child: const IconBtnWidget(
                        icon: "user",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ShopPage()));
                      },
                      child: const IconBtnWidget(
                        icon: "shop",
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 120.0),
                  child: WhiteBoxWidget(
                    width: MediaQuery.of(context).size.width / 1.09589041,
                    height: MediaQuery.of(context).size.height / 4.48062016,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const StyledText(
                            text: "Баланс",
                            opacity: 0.34,
                            fontSize: 34,
                            color: Colors.black),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: (MediaQuery.of(context).size.height /
                                      4.48062016) /
                                  3),
                          child: StyledText(
                              text: "${user.balance}KK",
                              opacity: 1,
                              fontSize: 32,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: incrementCounter,
                  child: WhiteBoxWidget(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 2.48062016,
                    child: const Center(
                        child: Opacity(
                      opacity: 0.40,
                      child: Text(
                        'Кликай!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontFamily: 'SF UI Display',
                          fontWeight: FontWeight.w800,
                          height: 0,
                          letterSpacing: 1.12,
                        ),
                      ),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

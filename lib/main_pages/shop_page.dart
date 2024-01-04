import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kvantfront/main_page.dart';
import 'package:kvantfront/widgets/icon_button.dart';
import 'package:kvantfront/widgets/shop_element.dart';
import 'package:kvantfront/widgets/text.dart';
import 'package:kvantfront/widgets/white_container.dart';

import '../main.dart';

var sup_controller = StreamController<String>.broadcast();

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  StreamSubscription? subscription;
  int speed = user.getSpeed();

  void updateSpeed() {
    setState(() {
      speed = user.getSpeed();
    });
  }

  @override
  void initState() {
    super.initState();
    subscription = sup_controller.stream.listen((index) {
      setState(() {
        speed = user.getSpeed();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        updateSpeed();
      },
      child: Material(
        child: Container(
          color: const Color.fromRGBO(73, 146, 255, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainPage()));
                      },
                      child: const IconBtnWidget(icon: "back")),
                  Column(
                    children: [
                      const StyledText(
                          text: "Итого",
                          opacity: 1,
                          fontSize: 30,
                          color: Colors.white),
                      WhiteBoxWidget(
                          width: MediaQuery.sizeOf(context).width / (320 / 195),
                          height:
                              MediaQuery.sizeOf(context).height / (568 / 30),
                          child: Center(
                            child: StyledText(
                                text: "${speed}KK/c",
                                opacity: 1,
                                fontSize: 24,
                                color: Colors.black),
                          ))
                    ],
                  )
                ],
              ),
              WhiteBoxWidget(
                width: MediaQuery.sizeOf(context).width / (320 / 304),
                height: MediaQuery.sizeOf(context).height / (568 / 476),
                // child: SingleChildScrollView(
                child: ListView(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: MediaQuery.sizeOf(context).width /
                          (320 / 287) /
                          3 *
                          .1),
                  children: const [
                    ShopElementWidget(
                        name: "Палец", mining: 1, multiplier: 1.02, price: 100),
                    ShopElementWidget(
                        name: "Роборука",
                        mining: 10,
                        multiplier: 1.03,
                        price: 500),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

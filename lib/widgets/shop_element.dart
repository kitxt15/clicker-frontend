// ignore_for_file: no_logic_in_create_state
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kvantfront/widgets/text.dart';
import 'package:kvantfront/widgets/white_container.dart';

class ShopElementWidget extends StatefulWidget {
  const ShopElementWidget(
      {super.key,
      required this.name,
      required this.amount,
      required this.mining,
      required this.multiplier,
      required this.price});

  final String name;
  final int mining;
  final int amount;
  final double multiplier;
  final int price;

  @override
  State<ShopElementWidget> createState() =>
      _ShopElementWidgetState(name, mining, amount, multiplier, price);
}

class _ShopElementWidgetState extends State<ShopElementWidget> {
  String name;
  int mining;
  int amount;
  double multiplier;
  int price;

  _buyUpgrade() {
    setState(() {
      amount++;
    });
  }

  _ShopElementWidgetState(
      this.name, this.mining, this.amount, this.multiplier, this.price);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / (320 / 287),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: WhiteBoxWidget(
            width: MediaQuery.sizeOf(context).width / (320 / 287),
            height: MediaQuery.sizeOf(context).height / (568 / 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset("lib/assets/finger.png"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        StyledText(
                            text: name,
                            opacity: 1,
                            fontSize: 20,
                            color: Colors.black),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const StyledText(
                                text: "Количество:",
                                opacity: 0.4,
                                fontSize: 18,
                                color: Colors.black),
                            StyledText(
                                text: amount.toString(),
                                opacity: 1,
                                fontSize: 18,
                                color: Colors.black),
                          ],
                        ),
                        Row(
                          children: [
                            const StyledText(
                                text: "Добыча:",
                                opacity: 0.4,
                                fontSize: 18,
                                color: Colors.black),
                            StyledText(
                                text: "$miningКК/c",
                                opacity: 1,
                                fontSize: 18,
                                color: Colors.black)
                          ],
                        )
                      ],
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    _buyUpgrade();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width / (320 / 281) / 3,
                      height: MediaQuery.sizeOf(context).height / (568 / 43),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF4991FF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9)),
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
                          (price * pow(multiplier, amount)).toInt().toString(),
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: 'SF UI Display',
                            fontWeight: FontWeight.w800,
                            height: 0,
                            letterSpacing: 0.72,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

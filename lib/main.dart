// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kvantfront/auth_pages/registration_pages/email_page.dart';
import 'package:kvantfront/auth_pages/registration_pages/location_page.dart';
import 'package:kvantfront/auth_pages/registration_pages/password_page.dart';
import 'package:kvantfront/auth_pages/start_page.dart';
import 'package:kvantfront/main_page.dart';
import 'package:kvantfront/user.dart';

import 'auth_pages/registration_pages/nickname_page.dart';
import 'main_pages/profile_page.dart';

User user = User('', '');

void main() {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();

  if (user.isInit) {
    Timer.periodic(const Duration(seconds: 10), (timer) {
      user.sendUser();
    });
  }
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const StartPageWidget(),
        '/main': (context) => const MainApp(),
        '/registerName': (context) => const NicknameRegisterPageWidget(),
        '/registerPassword': (context) => const PasswordRegisterPageWidget(),
        '/registerEmail': (context) => const EmailRegisterPageWidget(),
        '/registerLocation': (context) => const LocationRegisterPageWidget(),
        '/profile': (context) => const ProfilePage()
      },
    );
  }
}

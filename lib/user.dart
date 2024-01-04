// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class User {
  int balance = 0;
  String username = "guest";
  String email = "<EMAIL>";
  String password = "<PASSWORD>";
  String location = "<LOCATION>";
  int fingerAmount = 0;
  int robotHandAmount = 0;
  bool isInit = false;

  User(String s, String t);

  Future<http.Response> getAllUsers() async {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:8080/users?'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 404) {
      throw Exception("not found");
    } else {
      throw Exception("something bad happened");
    }
  }

  Future<http.Response> getUser() async {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:8080/users/$username'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 404) {
      throw Exception("not found");
    } else {
      throw Exception("something bad happened");
    }
  }

  Future<http.Response> sendUser() async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/users?'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'balance': balance.toString(),
        'email': email,
        'password': password,
        'location': location,
        'finger_amount': fingerAmount.toString(),
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 404) {
      throw Exception("not found");
    } else {
      throw Exception("something bad happened");
    }
  }

  int getAmount(String name) {
    switch (name) {
      case "Палец":
        return fingerAmount;
      case "Роборука":
        return robotHandAmount;
      default:
        return 0;
    }
  }

  void buyUpgrade(String name) {
    switch (name) {
      case "Палец":
        fingerAmount++;
        break;
      case "Роборука":
        robotHandAmount++;
      default:
        break;
    }
  }

  void addUpgradesSalary() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      balance = balance + getSpeed();
      // setLocalDataInt('balance', balance + amount);
    });
  }

  Future<void> setLocalDataBool(String name, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(name, value);
  }

  Future<void> setLocalDataInt(String name, int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(name, value);
  }

  Future<void> setLocalDataString(String name, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(name, value);
  }

  Future<void> setLocalDataDouble(String name, double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(name, value);
  }

  Future<int?> getLocalDataInt(String name) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(name);
  }

  int getSpeed() {
    return fingerAmount * 1 + robotHandAmount * 10;
  }
}

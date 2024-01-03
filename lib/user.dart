// ignore_for_file: file_names

import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  int balance = 0;
  String username = "guest";
  String email = "<EMAIL>";
  String password = "<PASSWORD>";
  String location = "<LOCATION>";
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
        'email': email,
        'password': password,
        'location': location,
        'balance': balance.toString()
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
}

// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Pages/Assets/themes.dart' as colour;

class NextFixturesScreen extends StatelessWidget {
  const NextFixturesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        backgroundColor: colour.AppColours.secondAccent,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: colour.AppColours.blueBackground,
      body: Center(
        child: Text(
          "This is where the next fixtures for the players will be.",
          style:
              TextStyle(color: colour.AppColours.bodyTextColor, fontSize: 32),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

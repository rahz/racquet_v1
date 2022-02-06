import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Pages/Assets/colours.dart' as colour;

class MyClub extends StatelessWidget {
  const MyClub({Key? key}) : super(key: key);

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
          "This is where the clubs information will be.",
          style:
              TextStyle(color: colour.AppColours.bodyTextColor, fontSize: 32),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

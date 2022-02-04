import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Pages/Assets/colours.dart' as Colour;

class MobilePlayerAssistant extends StatelessWidget {
  const MobilePlayerAssistant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.AppColours.blueBackground,
      body: Center(
        child: Text(
          "Player",
          style: TextStyle(color: Colour.AppColours.bodyTextColor),
        ),
      ),
    );
  }
}

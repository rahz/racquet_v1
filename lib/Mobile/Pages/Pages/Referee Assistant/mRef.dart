import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Pages/Assets/colours.dart' as colour;

class MobileRef extends StatelessWidget {
  const MobileRef({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colour.AppColours.blueBackground,
      body: Center(
        child: Text(
          "Referee Assistant",
          style: TextStyle(color: colour.AppColours.bodyTextColor),
        ),
      ),
    );
  }
}

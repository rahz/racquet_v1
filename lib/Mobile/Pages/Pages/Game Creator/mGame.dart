import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Pages/Assets/themes.dart' as Colour;

class MobileGameAssitant extends StatelessWidget {
  const MobileGameAssitant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Text(
          "Game",
          style: TextStyle(color: Colour.AppColours.bodyTextColor),
        ),
      ),
    );
  }
}

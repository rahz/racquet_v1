import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Pages/Assets/colours.dart' as colour;

class GreetingMessage extends StatelessWidget {
  const GreetingMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Good" + "Hello",
          style:
              TextStyle(color: colour.AppColours.bodyTextColor, fontSize: 24),
        )
      ],
    );
  }
}

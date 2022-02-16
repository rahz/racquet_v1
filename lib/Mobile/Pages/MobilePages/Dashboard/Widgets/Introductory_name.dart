// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class GreetingMessage extends StatelessWidget {
  const GreetingMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String greeting() {
      var hour = DateTime.now().hour;

      if (hour >= 0 && hour <= 6) {
        return 'Night';
      } else if (hour >= 7 && hour <= 11) {
        return 'Morning';
      } else if (hour >= 12 && hour <= 18) {
        return 'Afternoon';
      } else if (hour >= 19 && hour <= 24) {
        return 'Evening';
      }
      return 'L';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Good " + greeting() + ",",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

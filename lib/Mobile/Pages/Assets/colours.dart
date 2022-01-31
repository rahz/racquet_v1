import 'dart:ui';
import 'package:flutter/material.dart';

class AppColours {
  static Color blueBackground = const Color(0xFF080321);
  static Color secondAccent = const Color(0xFF3A3D58);
  static Color bodyTextColor = const Color(0xFFFFFFFF);
}

class test extends StatelessWidget {
  const test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigator.of(context).pop();
      },
      child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 2, color: Colors.white)),
            child: const Icon(
              Icons.cancel,
              color: Colors.white,
            ),
          )),
    );
  }
}

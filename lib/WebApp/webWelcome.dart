// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class WebWelcome extends StatelessWidget {
  const WebWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: Center(
        child: Text(
          "Web",
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}

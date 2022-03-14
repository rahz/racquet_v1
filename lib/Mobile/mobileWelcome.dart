// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class MobileWelcome extends StatefulWidget {
  const MobileWelcome({Key? key}) : super(key: key);

  @override
  State<MobileWelcome> createState() => _MobileWelcomeState();
}

class _MobileWelcomeState extends State<MobileWelcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text(
          "Mobile",
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}

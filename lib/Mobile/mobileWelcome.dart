import 'package:flutter/material.dart';

class mobileWelcome extends StatefulWidget {
  const mobileWelcome({Key? key}) : super(key: key);

  @override
  State<mobileWelcome> createState() => _mobileWelcomeState();
}

class _mobileWelcomeState extends State<mobileWelcome> {
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

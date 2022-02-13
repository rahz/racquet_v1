import 'package:flutter/material.dart';

class tabletWelcome extends StatelessWidget {
  const tabletWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Text(
          "Tablet",
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}

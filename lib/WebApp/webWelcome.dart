import 'package:flutter/material.dart';

class webWelcome extends StatelessWidget {
  const webWelcome({Key? key}) : super(key: key);

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

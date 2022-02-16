// ignore_for_file: prefer_const_constructors, camel_case_types, file_names

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

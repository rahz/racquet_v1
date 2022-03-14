// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class MobileRef extends StatelessWidget {
  const MobileRef({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Text(
          "Referee Assistant",
          style: TextStyle(),
        ),
      ),
    );
  }
}

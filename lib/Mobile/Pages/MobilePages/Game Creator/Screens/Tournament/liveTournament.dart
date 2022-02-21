// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LiveTourneyScreen extends StatelessWidget {
  const LiveTourneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_back,
          color: Theme.of(context).backgroundColor,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Text(
          "Tournament Filler",
          style: TextStyle(fontSize: 32),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

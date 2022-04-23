// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Game%20Creator/mGame.dart';
import 'package:racquet_v1/Mobile/mobileMainv2.dart';

class LiveTourneyScreen extends StatelessWidget {
  LiveTourneyScreen({
    Key? key,
  }) : super(key: key);

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
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => MobileAppStateful()));
          },
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          children: [
            CircularProgressIndicator(),
            Text('Live Tournament Loading'),
          ],
        ));
  }
}

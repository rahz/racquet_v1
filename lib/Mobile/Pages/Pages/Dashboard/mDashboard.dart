import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Pages/Assets/colours.dart' as colour;
import 'package:racquet_v1/Mobile/Pages/Pages/Dashboard/Widgets/Introductory_name.dart';

class MobileDashboard extends StatelessWidget {
  const MobileDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colour.AppColours.blueBackground,
      body: Column(
        children: [GreetingMessage()],
      ),
    );
  }
}

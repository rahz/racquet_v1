import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Pages/Assets/colours.dart' as colour;

class NextMatchDashboardBox extends StatelessWidget {
  const NextMatchDashboardBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: 175,
      decoration: BoxDecoration(
          color: colour.AppColours.secondAccent,
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';

import 'package:racquet_v1/Mobile/Pages/MobilePages/Dashboard/Screens/nextFixtures.dart';

class ResumeLeagueButton extends StatelessWidget {
  const ResumeLeagueButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NextFixturesScreen()),
        );
      }),
      child: Container(
        height: 175,
        width: 175,
        decoration: BoxDecoration(
            color: Theme.of(context)
                .primaryColor, //colour.AppColours.secondAccent,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: FittedBox(
          fit: BoxFit.fitHeight,
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 150),
                  Text("Resume League", style: TextStyle(fontSize: 15))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

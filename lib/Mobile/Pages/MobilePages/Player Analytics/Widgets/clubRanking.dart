// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Player%20Analytics/Screen/clubRankingScreen.dart';

class ClubRankingButton extends StatelessWidget {
  const ClubRankingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ClubRankingScreen()),
        );
      }),
      child: Container(
        height: 175,
        width: 175,
        decoration: BoxDecoration(
            color: Theme.of(context)
                .primaryColor, //colour.AppColours.secondAccent,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              //mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 0),
                Text("Club Ranking", style: TextStyle(fontSize: 18)),
                SizedBox(height: 37),
                rank()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget rank() {
  return FittedBox(
      fit: BoxFit.contain,
      child: Text(
        "1",
        style: TextStyle(fontSize: 55),
      ));
}

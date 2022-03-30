// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Dashboard/Screens/nextFixtures.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Game%20Creator/Screens/Tournament/liveTournament.dart';
import 'package:relative_scale/relative_scale.dart';

class ResumeTourneyButton extends StatelessWidget {
  const ResumeTourneyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return GestureDetector(
          // onTap: (() {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => const LiveTourneyScreen()),
          //   );
          // }),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: sy(120),
              width: sy(120),
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
                        Text("Resume Tournament",
                            style: TextStyle(fontSize: 15))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Dashboard/Screens/nextFixtures.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../Player Analytics/Screen/clubRankingScreen.dart';

class NextMatchDashboardBox extends StatelessWidget {
  const NextMatchDashboardBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return GestureDetector(
          onTap: (() {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ClubRankingScreen()),
            );
          }),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              height: 175,
              width: 175,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
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
                        Text(
                          "Next Match",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Feb",
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                  Text(
                                    "7",
                                    style: TextStyle(
                                      fontSize: 35,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                              SizedBox(width: 10),
                              Image.asset(
                                'assets/images/bayern.png',
                                height: 75,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text("Bayern Munich F.C.",
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

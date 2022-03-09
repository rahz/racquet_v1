// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../Player Analytics/Screen/clubRankingScreen.dart';

class LatestClubResultsBox extends StatelessWidget {
  const LatestClubResultsBox({Key? key}) : super(key: key);

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
          child: Container(
            height: sy(175),
            width: sx(497),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Latest Club Results",
                    textAlign: TextAlign.end,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                        color:
                            Theme.of(context).backgroundColor.withOpacity(0.4)),
                    height: 2,
                    width: 375,
                  ),
                  SizedBox(height: 5),
                  Expanded(
                      child: ListView.builder(
                          itemCount: 6,
                          itemBuilder: ((context, index) => Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              Icons.sports_tennis,
                                              size: 32,
                                            ),
                                            Text("Team $index"),
                                            Text(
                                              " 0 ",
                                              style: TextStyle(fontSize: 25),
                                            ),
                                            Text(" - "),
                                            Text(
                                              " 21",
                                              style: TextStyle(fontSize: 25),
                                            ),
                                            Text("Team 2"),
                                            Icon(
                                              Icons.sports_tennis,
                                              size: 32,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        )
                                      ],
                                    ),
                                  )
                              //make index the latest descedning scores

                              )))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

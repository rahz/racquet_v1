// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class PlayerStatisticsBox extends StatelessWidget {
  const PlayerStatisticsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          height: 175,
          width: 375,
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
                  "Player Statistics",
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
                Table(
                  border: TableBorder(/*horizontalInside: ,verticalInside*/),
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 40),
                                child: Column(
                                  children: [
                                    Text(
                                      "Aces",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "20",
                                      style: TextStyle(fontSize: 28),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Column(
                                  children: [
                                    Text(
                                      " Matches Won",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      " 75%",
                                      style: TextStyle(fontSize: 28),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    " Points Won:",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    " 281",
                                    style: TextStyle(fontSize: 28),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Points Lost:",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "140",
                                      style: TextStyle(fontSize: 28),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

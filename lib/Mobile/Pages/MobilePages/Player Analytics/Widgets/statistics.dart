// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../Screen/clubRankingScreen.dart';

class PlayerStatisticsBox extends StatelessWidget {
  const PlayerStatisticsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('statistics')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot3) {
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
                  height: 175,
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
                          "Player Statistics",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .backgroundColor
                                  .withOpacity(0.4)),
                          height: 2,
                          width: 375,
                        ),
                        SizedBox(height: 5),
                        Table(
                          border: TableBorder(
                              /*horizontalInside: ,verticalInside*/),
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 40),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Aces",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              snapshot3.data!['aces']
                                                  .toString(),
                                              style: TextStyle(fontSize: 28),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 30),
                                        child: Column(
                                          children: [
                                            Text(
                                              " Conversion Rate",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              ((snapshot3.data![
                                                          'Total Points Won']) /
                                                      (snapshot3.data![
                                                          'Total Points Lost']))
                                                  .toStringAsFixed((2)),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
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
                                            snapshot3.data!['Total Points Won']
                                                .toString(),
                                            style: TextStyle(fontSize: 28),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Points Lost:",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              snapshot3
                                                  .data!['Total Points Lost']
                                                  .toString(),
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
              );
            },
          );
        });
  }
}

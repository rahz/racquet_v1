// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Player%20Analytics/Widgets/clubRanking.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Player%20Analytics/Widgets/currentForm.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Player%20Analytics/Widgets/performance.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Player%20Analytics/Widgets/statistics.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Player%20Analytics/Widgets/touneyWinsPie.dart';

class MobilePlayerAssistant extends StatelessWidget {
  const MobilePlayerAssistant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        // backgroundColor: colour.AppColours.blueBackground,
        body: ListView(
          children: [
            SizedBox(height: 10),
            // Padding(
            //   padding: EdgeInsets.only(left: 10, right: 10, top: 20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       TourneyWinsButton(),
            //       SizedBox(width: 13),
            //       ClubRankingButton(),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 10),
            // Padding(
            //   padding: const EdgeInsets.all(5),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       CurrentFormBox(),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PlayerStatisticsBox(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PlayerPerformanceBox(),
                ],
              ),
            ),
          ],
        ),
      );
}

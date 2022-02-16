// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Dashboard/Widgets/Introductory_name.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Dashboard/Widgets/latest_c_results.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Dashboard/Widgets/my_club.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Dashboard/Widgets/next_match.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Dashboard/Widgets/Latest_p_results.dart';

class MobileDashboard extends StatelessWidget {
  const MobileDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        // backgroundColor: colour.AppColours.blueBackground,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 130, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GreetingMessage(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 190, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Rahul Khimani",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 30)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NextMatchDashboardBox(),
                  SizedBox(width: 30),
                  MyClubDashboardBox(),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LatestPlayerResultsBox(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LatestClubResultsBox(),
                ],
              ),
            ),
          ],
        ),
      );
}

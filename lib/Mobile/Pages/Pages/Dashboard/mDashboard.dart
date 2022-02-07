import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Pages/Assets/colours.dart' as colour;
import 'package:racquet_v1/Mobile/Pages/Pages/Dashboard/Widgets/Introductory_name.dart';
import 'package:racquet_v1/Mobile/Pages/Pages/Dashboard/Widgets/my_club.dart';
import 'package:racquet_v1/Mobile/Pages/Pages/Dashboard/Widgets/next_match.dart';

class MobileDashboard extends StatelessWidget {
  const MobileDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GreetingMessage(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Rahul Khimani",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: colour.AppColours.bodyTextColor, fontSize: 30)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NextMatchDashboardBox(),
                MyClubDashboardBox(),
              ],
            ),
          ),
        ],
      );

  Widget whole(BuildContext context) {
    return Scaffold(
      backgroundColor: colour.AppColours.blueBackground,
    );
  }
}

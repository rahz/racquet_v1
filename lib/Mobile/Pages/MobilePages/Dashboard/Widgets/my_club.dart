// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Dashboard/Screens/myclubscreen.dart';

class MyClubDashboardBox extends StatelessWidget {
  const MyClubDashboardBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: 175,
    //   width: 175,
    //   decoration: BoxDecoration(
    //       color: colour.AppColours.secondAccent,
    //       borderRadius: BorderRadius.all(Radius.circular(20))),
    // );

    return GestureDetector(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyClub()),
        );
      }),
      child: Container(
        height: 175,
        width: 175,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "My Club",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(height: 10),
                Image.asset(
                  'assets/images/manunited.png',
                  height: 100,
                ),
                SizedBox(height: 5),
                Text("Manchester United", style: TextStyle(fontSize: 18))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

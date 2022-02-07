import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:racquet_v1/Mobile/Pages/Assets/colours.dart' as colour;
import 'package:racquet_v1/Mobile/Pages/Pages/Dashboard/Screens/myclubscreen.dart';

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
            color: colour.AppColours.secondAccent,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "My Club",
                  style: TextStyle(
                      color: colour.AppColours.bodyTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Image.asset(
                  'assets/images/manunited.png',
                  height: 110,
                ),
                Text("Manchester United",
                    style: TextStyle(
                        color: colour.AppColours.bodyTextColor, fontSize: 11))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

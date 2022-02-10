import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Pages/Assets/themes.dart' as colour;
import 'package:racquet_v1/Mobile/Pages/Pages/Dashboard/Screens/nextFixtures.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class NextMatchDashboardBox extends StatelessWidget {
  const NextMatchDashboardBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NextFixturesScreen()),
        );
      }),
      child: Container(
        height: 175,
        width: 175,
        decoration: BoxDecoration(
            color: Theme.of(context)
                .primaryColor, //colour.AppColours.secondAccent,
            borderRadius: BorderRadius.all(Radius.circular(20))),
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
                      color: colour.AppColours.bodyTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
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
                              color: colour.AppColours.bodyTextColor,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          Text(
                            "7",
                            style: TextStyle(
                                fontSize: 35,
                                color: colour.AppColours.bodyTextColor),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/bayern.png',
                        height: 75,
                      ),
                    ],
                  ),
                ),
                Text("Bayern Munich F.C.",
                    style: TextStyle(
                        color: colour.AppColours.bodyTextColor, fontSize: 15))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

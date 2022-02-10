import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:racquet_v1/Mobile/Pages/Assets/themes.dart' as colour;
import 'package:racquet_v1/Mobile/Pages/Pages/Dashboard/Screens/myclubscreen.dart';

class LatestPlayerResultsBox extends StatelessWidget {
  const LatestPlayerResultsBox({Key? key}) : super(key: key);

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
      // onTap: (() {
      //   Navigator.push(
      //     context,
      //     //MaterialPageRoute(builder: (context) => const MyClub()),
      //   );
      // }),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 15),
        child: Container(
          height: 175,
          width: 350,
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
                  "Latest Player Results",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: colour.AppColours.bodyTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

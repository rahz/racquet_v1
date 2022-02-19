// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

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
                  "Latest Player Results",
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.sports_tennis,
                                            size: 32,
                                          ),
                                          Text("Player $index"),
                                          Text(
                                            " 0 ",
                                            style: TextStyle(fontSize: 25),
                                          ),
                                          Text(" - "),
                                          Text(
                                            " 21",
                                            style: TextStyle(fontSize: 25),
                                          ),
                                          Text("Rahul K."),
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
                            //make index the latest descending scores

                            )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

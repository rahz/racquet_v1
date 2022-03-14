// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Dashboard/Screens/nextFixtures.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:relative_scale/relative_scale.dart';

import '../Screen/clubRankingScreen.dart';

class TourneyWinsButton extends StatelessWidget {
  const TourneyWinsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wins = 5;
    double loss = 3;
    //double total = wins + loss;

    Map<String, double> dataMap = {
      "Wins": wins,
      "Loss": loss,
    };

    var winsTotal = wins.toInt();

    final colorList = <Color>[
      Theme.of(context).backgroundColor,
      Theme.of(context).backgroundColor.withOpacity(0.2)
    ];

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
            width: 175,
            decoration: BoxDecoration(
                color: Theme.of(context)
                    .primaryColor, //colour.AppColours.secondAccent,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Tournaments", style: TextStyle(fontSize: 18)),
                    SizedBox(height: 7),
                    SizedBox(
                        height: 133,
                        child: PieChart(
                            dataMap: dataMap,
                            chartType: ChartType.ring,
                            ringStrokeWidth: 8,
                            colorList: colorList,
                            initialAngleInDegree: -90,
                            centerText: "Wins\n$winsTotal",
                            centerTextStyle: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.color),
                            legendOptions: LegendOptions(showLegends: false),
                            chartValuesOptions: ChartValuesOptions(
                                showChartValues: false,
                                chartValueBackgroundColor: Colors.transparent)))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

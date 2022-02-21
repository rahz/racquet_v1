// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Game%20Creator/Widgets/cLeague.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Game%20Creator/Widgets/cTournament.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Game%20Creator/Widgets/rLeague.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Game%20Creator/Widgets/rTournament.dart';

class MobileGameBuilder extends StatelessWidget {
  const MobileGameBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        // backgroundColor: colour.AppColours.blueBackground,
        body: Center(
          child: ListView(
            children: [
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TourneyButton(),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LeagueButton(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 0, right: 0, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ResumeTourneyButton(),
                    ResumeLeagueButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

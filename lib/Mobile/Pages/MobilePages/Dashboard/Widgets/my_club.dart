// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:racquet_v1/Mobile/Logic/Firebase/clubmodel.dart';
import 'package:racquet_v1/Mobile/Logic/Firebase/usermodel.dart';
import 'package:racquet_v1/Mobile/Logic/providers/userProvider.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Dashboard/Screens/myclubscreen.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../../Logic/providers/clubProvider.dart';
import '../../Player Analytics/Screen/clubRankingScreen.dart';

class MyClubDashboardBox extends StatelessWidget {
  const MyClubDashboardBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserProvider>(context).getUser;
    final ClubModel club = Provider.of<ClubProvider>(context).getClub;
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
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: FittedBox(
              fit: BoxFit.contain,
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    club.club_logo.toString(),
                                  ),
                                  fit: BoxFit.cover),
                            ),
                            height: 105,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(club.club_abr!.toString(),
                            style: TextStyle(fontSize: 18))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Firebase/usermodel.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Dashboard/Widgets/Introductory_name.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Dashboard/Widgets/latest_c_results.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Dashboard/Widgets/my_club.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Dashboard/Widgets/next_match.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Dashboard/Widgets/Latest_p_results.dart';

class MobileDashboard extends StatefulWidget {
  const MobileDashboard({Key? key}) : super(key: key);

  @override
  State<MobileDashboard> createState() => _MobileDashboardState();
}

class _MobileDashboardState extends State<MobileDashboard> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final userFirstname = loggedInUser.forename;
    final userSurname = loggedInUser.surname;
    return Scaffold(
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
                Text("${loggedInUser.forename} ${loggedInUser.surname}",
                    textAlign: TextAlign.left, style: TextStyle(fontSize: 30)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Wrap(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NextMatchDashboardBox(),
                    SizedBox(width: 20),
                    MyClubDashboardBox(),
                  ],
                ),
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
}

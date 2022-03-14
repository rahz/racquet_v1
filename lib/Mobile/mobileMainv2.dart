// ignore_for_file: prefer_const_constructors, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:racquet_v1/Mobile/LogInScreen.dart';
import 'package:racquet_v1/Mobile/Logic/Firebase/authoriser.dart';
import 'Logic/Firebase/usermodel.dart';
import 'Logic/Utilities/snackbar.dart';
import 'Logic/providers/userProvider.dart';
import 'Pages/MobilePages/Settings/mSettings.dart';
import 'Pages/MobilePages/Dashboard/mDashboard.dart';
import 'Pages/MobilePages/Player Analytics/mPlayer.dart';
import 'Pages/MobilePages/Game Creator/mGame.dart';
import 'Pages/MobilePages/Referee Assistant/mRef.dart';

class MobileAppStateful extends StatefulWidget {
  const MobileAppStateful({Key? key}) : super(key: key);

  @override
  _MobileAppStateful createState() => _MobileAppStateful();
}

class _MobileAppStateful extends State<MobileAppStateful>
    with SingleTickerProviderStateMixin {
  late TabController _screenSwitcher;
  int navIndex = 2;
  String appBarTitle = 'demo';
  bool isLoading = false;
  dynamic userData;

  @override
  void initState() {
    _screenSwitcher = TabController(length: 5, vsync: this);
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      userData = userSnap.data()!;

      setState(() {});
    } catch (e) {
      showSnackBar(
        e.toString(),
        context,
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _screenSwitcher.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserModel player = Provider.of<UserProvider>(context).getUser;

    if (navIndex == 0) {
      appBarTitle = 'Referee Assistant';
    } else if (navIndex == 1) {
      appBarTitle = 'Game Creator';
    } else if (navIndex == 2) {
      appBarTitle = 'Dashboard';
    } else if (navIndex == 3) {
      appBarTitle = 'Player Analytics';
    } else if (navIndex == 4) {
      appBarTitle = 'Settings';
    }
    final screens = [
      MobileRef(),
      MobileGameBuilder(),
      MobileDashboard(),
      MobilePlayerAssistant(),
      MobileSettings(),
    ];

    final items = <Widget>[
      Icon(LineAwesomeIcons.stopwatch, size: 30),
      Icon(LineAwesomeIcons.trophy, size: 30),
      Icon(LineAwesomeIcons.home, size: 30),
      Icon(LineAwesomeIcons.line_chart, size: 30),
      Icon(LineAwesomeIcons.cog, size: 30),
    ];
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            body: screens[navIndex],
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(55),
              child: AppBar(
                //elevation: 0,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
                    child: Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Sign Out"),
                                content:
                                    Text("Are you sure you want to sign out?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Authoriser().signOut();
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()),
                                        (Route<dynamic> route) => false,
                                      );
                                    },
                                    child: Text("Yes"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("No"),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(userData['ppURL']),
                            //player.ppURL!),
                            radius: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                automaticallyImplyLeading: false,
                backgroundColor:
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
                title: Text(
                  appBarTitle,
                  //textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).textTheme.bodyText2?.color),
                ),
              ),
            ),
            backgroundColor: Color(0xFF080321),
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                iconTheme: IconThemeData(
                    size: 15, color: Theme.of(context).iconTheme.color),
              ),
              child: CurvedNavigationBar(
                color: Theme.of(context).primaryColor,
                buttonBackgroundColor: Theme.of(context)
                    .primaryColor
                    .withOpacity(0.4)
                    .withAlpha(200)
                    .withBlue(255),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                height: 60,
                animationCurve: Curves.easeInOutCubic,
                animationDuration: Duration(milliseconds: 450),
                items: items,
                index: navIndex,
                onTap: (navIndex) => setState(() => this.navIndex = navIndex),
              ),
            ),
          );
  }
}

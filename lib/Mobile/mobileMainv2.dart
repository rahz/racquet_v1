// ignore_for_file: prefer_const_constructors, file_names

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'Pages/Pages/Settings/mSettings.dart';
import 'Pages/Pages/Dashboard/mDashboard.dart';
import 'Pages/Pages/Player Analytics/mPlayer.dart';
import 'Pages/Pages/Game Creator/mGame.dart';
import 'Pages/Pages/Referee Assistant/mRef.dart';
import 'package:racquet_v1/Mobile/Pages/Assets/colours.dart' as colour;

void main() => runApp(const MobileApp());

class MobileApp extends StatelessWidget {
  const MobileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Racquet',
      home: MobileAppStateful(),
    );
  }
}

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

  @override
  void initState() {
    _screenSwitcher = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _screenSwitcher.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      MobileGameAssitant(),
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
    return Scaffold(
      body: screens[navIndex],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
          child: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print('Pressed');
                        },
                        child: Container(
                          child: const CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                ExactAssetImage('assets/images/person.jpeg'),
                          ),
                          padding: const EdgeInsets.all(1.0), // borde width
                          decoration: BoxDecoration(
                            color: Colors.white, // border color
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    ]),
              ),
            ],
            backgroundColor: colour.AppColours.blueBackground,
            title: Text(
              appBarTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  color: colour.AppColours.bodyTextColor,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFF080321),
      // bottomNavigationBar: Container(
      //   margin: EdgeInsets.all(20),
      //   decoration: BoxDecoration(
      //       color: Color(0xFF3A3D58),
      //       borderRadius: BorderRadius.circular(30)),
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.circular(30),
      //     child: DefaultTabController(
      //       length: 4,
      //       child: TabBar(
      //         controller: _screenSwitcher,
      //         unselectedLabelColor: Color(0xFF080321),
      //         indicator: ShapeDecoration(
      //             shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(35),
      //                 side: BorderSide(
      //                   color: Colors.white,
      //                 ))),
      //         tabs: [
      //           Tab(
      //             icon: Icon(Icons.home),
      //           ),
      //           Tab(
      //             icon: Icon(Icons.person),
      //           ),
      //           Tab(
      //             icon: Icon(Icons.gamepad),
      //           ),
      //           Tab(
      //             icon: Icon(Icons.show_chart),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        child: CurvedNavigationBar(
          color: colour.AppColours.secondAccent,
          buttonBackgroundColor: colour.AppColours.navButton,
          backgroundColor: Colors.transparent,
          height: 60,
          animationCurve: Curves.easeInOutCubic,
          animationDuration: Duration(milliseconds: 450),
          items: items,
          index: navIndex,
          onTap: (navIndex) => setState(() => this.navIndex = navIndex),
        ),
      ),

      // body: TabBarView(
      //   children: [
      //     MobileDashboard(),
      //     MobileRef(),
      //     MobileGameAssitant(),
      //     MobilePlayerAssistant(),
      //     MobileSettings(),
      //   ],
      //   controller: _screenSwitcher,
      // ),
    );
  }
}

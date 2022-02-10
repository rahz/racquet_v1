// ignore_for_file: prefer_const_constructors, file_names

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:racquet_v1/Mobile/Pages/Pages/Settings/Widgets.dart';
import 'Pages/Assets/themes.dart';
import 'Pages/Pages/Settings/mSettings.dart';
import 'Pages/Pages/Dashboard/mDashboard.dart';
import 'Pages/Pages/Player Analytics/mPlayer.dart';
import 'Pages/Pages/Game Creator/mGame.dart';
import 'Pages/Pages/Referee Assistant/mRef.dart';
import 'package:racquet_v1/Mobile/Pages/Assets/themes.dart';

void main() => runApp(const MobileApp());

class MobileApp extends StatelessWidget {
  const MobileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Racquet',
            themeMode: themeProvider.themeMode,
            theme: AppColours.lightTheme,
            darkTheme: AppColours.darkTheme,
            home: MobileAppStateful(),
          );
        },
      );
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
                        print('Pressed');
                      },
                      child: Container(
                        child: const CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              ExactAssetImage('assets/images/person.jpeg'),
                        ),
                        padding: const EdgeInsets.all(1.5), // borde width
                        decoration: BoxDecoration(
                            color: Theme.of(context)
                                .backgroundColor, // border color
                            shape: BoxShape.circle),
                      ),
                    )
                  ]),
            ),
          ],
          backgroundColor:
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
          title: Text(
            appBarTitle,
            //textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 18,
                color: AppColours.bodyTextColor,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
      backgroundColor: Color(0xFF080321),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.white),
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

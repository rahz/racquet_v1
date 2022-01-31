import 'package:flutter/material.dart';
import 'Pages/Pages/Dashboard/mDashboard.dart';
import 'Pages/Pages/Player Analytics/mPlayer.dart';
import 'Pages/Pages/Game Creator/mGame.dart';
import 'Pages/Pages/Referee Assistant/mRef.dart';

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

  @override
  void initState() {
    _screenSwitcher = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _screenSwitcher.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF080321),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Color(0xFF3A3D58), borderRadius: BorderRadius.circular(30)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: DefaultTabController(
            length: 4,
            child: TabBar(
              controller: _screenSwitcher,
              unselectedLabelColor: Color(0xFF080321),
              indicator: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                      side: BorderSide(
                        color: Colors.white,
                      ))),
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.person),
                ),
                Tab(
                  icon: Icon(Icons.gamepad),
                ),
                Tab(
                  icon: Icon(Icons.show_chart),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        children: [
          MobileDashboard(),
          MobileRef(),
          MobileGameAssitant(),
          MobilePlayerAssistant(),
        ],
        controller: _screenSwitcher,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class mGame extends StatefulWidget {
  const mGame({Key? key}) : super(key: key);

  @override
  _mGameState createState() => _mGameState();
}

class _mGameState extends State<mGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF080321),
      body: Stack(
        
        children: [
          Align(
            alignment: Alignment(0.0, 1.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              child: BottomNavigationBar(
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
                showSelectedLabels: true,
                showUnselectedLabels: false,
                backgroundColor: Colors.black,
                onTap: (int index) {},
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Referee Assistant',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.gamepad),
                    label: 'Game Creator',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.bar_chart),
                    label: 'Player Analytics',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
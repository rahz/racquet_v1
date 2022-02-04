// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   final String title;

//   HomePage({Key key, this.auth, this.userId, this.onSignedOut, this.title})
//       : super(key: key);

//   final BaseAuth auth;
//   final VoidCallback onSignedOut;
//   final String userId;

//   @override
//   State<StatefulWidget> createState() => new _HomePageState();
//  }

// class _HomePageState extends State<HomePage> {
//   int _currentIndex = 0;
//   String _title;

//   final List<Widget> _children = [
//      Projects(),
//      TimedProject(),
//      Overview(),
//      Clients(),
//   ];

//   GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

//  @override
//   initState(){
//     _title = 'Some default value';
//   }


//   @override
//   Widget build(BuildContext context) {
//      return new Scaffold(
//        key: _scaffoldKey,
//        appBar: AppBar(
//        title: Text(_title,
//           style: TextStyle(color: Colors.black),
//        ),

//        backgroundColor: Colors.white,
//       ),
//   endDrawer: AppDrawer(),
//   body: _children[_currentIndex],
//   bottomNavigationBar: BottomNavigationBar(
//     onTap: onTabTapped,
//     currentIndex: _currentIndex,
//     selectedItemColor: Theme.of(context).primaryColor,
//     type: BottomNavigationBarType.fixed,
//     items: [
//       new BottomNavigationBarItem(
//         icon: Icon(Icons.storage),
//         title: Text('Jobs'),
//       ),
//       new BottomNavigationBarItem(
//         icon: Icon(Icons.timer),
//         title: Text('Timer'),
//       ),
//       new BottomNavigationBarItem(
//         icon: Icon(Icons.pie_chart_outlined),
//         title: Text('Overview'),
//       ),
//       new BottomNavigationBarItem(
//           icon: Icon(Icons.supervisor_account), title: Text('Clients'))
//     ],
//   ),
// );
// }

//    void onTabTapped(int index) {
//      setState(() {
//      _currentIndex = index;
//       switch(index) { 
//        case 0: { _title = 'Jobs'; } 
//        break; 
//        case 1: { _title = 'Timer'; } 
//        break;
//        case 2: { _title = 'Overview'; } 
//        break;
//        case 3: { _title = 'Clients'; } 
//        break; 
//       } 
//      });
//    }
// }
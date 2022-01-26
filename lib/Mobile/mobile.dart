import 'package:flutter/material.dart';
import 'Screens/mDashboard.dart';

void main() => runApp(const MobileApp());

class MobileApp extends StatelessWidget {
  const MobileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Racquet',
      home: mDashboard(),
    );
  }
}

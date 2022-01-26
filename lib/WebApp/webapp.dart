import 'package:flutter/material.dart';

void main() => runApp(const WebApp());

class WebApp extends StatelessWidget {
  const WebApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      home: Scaffold(
        backgroundColor: Color(0xFF42267A),
      ),
    );
  }
}

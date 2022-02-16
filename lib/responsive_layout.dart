// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileHome;
  final Widget webHome;
  final Widget tabletHome;

  ResponsiveLayout(
      {Key? key,
      required this.mobileHome,
      required this.tabletHome,
      required this.webHome})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 700) {
          return mobileHome;
        } else if (constraints.maxWidth < 1024) {
          return tabletHome;
        } else {
          return webHome;
        }
      },
    );
  }
}

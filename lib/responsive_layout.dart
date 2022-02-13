import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileHome;
  final Widget webHome;
  final Widget tabletHome;

  ResponsiveLayout(
      {required this.mobileHome,
      required this.tabletHome,
      required this.webHome});

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

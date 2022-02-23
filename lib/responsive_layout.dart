// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Mobile/Logic/providers/userProvider.dart';

class ResponsiveLayout extends StatefulWidget {
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
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 700) {
          return widget.mobileHome;
        } else if (constraints.maxWidth < 1024) {
          return widget.tabletHome;
        } else {
          return widget.webHome;
        }
      },
    );
  }
}

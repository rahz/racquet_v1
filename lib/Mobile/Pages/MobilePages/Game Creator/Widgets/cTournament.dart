// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Game%20Creator/Screens/Tournament/selections.dart';
import 'package:relative_scale/relative_scale.dart';

class TourneyButton extends StatelessWidget {
  const TourneyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return GestureDetector(
          onTap: (() {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const TournamentSelectionEntries()),
            );
          }),
          child: SizedBox(
            height: sy(118),
            width: sx(500),
            child: Stack(
              children: [
                ClipPath(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 130.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                            image:
                                ExactAssetImage("assets/images/tourney.jpeg"),
                            fit: BoxFit.cover),
                        //color: Theme.of(context).backgroundColor,
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  clipper: CustomClipPath(),
                ),
                ClipPath(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  clipper: CustomClipPath2(),
                ),
                ClipPath(
                  child: Container(
                    decoration:
                        BoxDecoration(color: Theme.of(context).backgroundColor),
                  ),
                  clipper: CustomClipPath3(),
                ),
                Column(
                  children: [
                    SizedBox(height: 85),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Create a\nTournament",
                        style: TextStyle(fontSize: 35),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomClipPath3 extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(182, 0);
    path.lineTo(184, 0);
    path.lineTo(249, 175);
    path.lineTo(247, 175);
    path.lineTo(182, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomClipPath2 extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(185, 0);
    path.lineTo(250, 175);
    path.lineTo(0, 175);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(185, 0);
    path.lineTo(375, 0);
    path.lineTo(375, 175);
    path.lineTo(250, 175);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'dart:ui';

class LeagueButton extends StatelessWidget {
  const LeagueButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      width: 375,
      child: Stack(
        children: [
          ClipPath(
            child: Padding(
              padding: const EdgeInsets.only(left: 60.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      image: ExactAssetImage("assets/images/league.png"),
                      fit: BoxFit.cover),
                  //color: Theme.of(context).backgroundColor,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
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
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "League Table\nCreator",
                  style: TextStyle(fontSize: 35),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomClipPath3 extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(249, 0);
    path.lineTo(184, 175);
    path.lineTo(182, 175);
    path.lineTo(247, 0);
    path.lineTo(249, 0);
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
    path.lineTo(250, 0);
    path.lineTo(185, 175);
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
    path.lineTo(250, 0);
    path.lineTo(375, 0);
    path.lineTo(375, 175);
    path.lineTo(185, 175);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

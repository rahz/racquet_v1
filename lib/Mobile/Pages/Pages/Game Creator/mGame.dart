import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Pages/Assets/colours.dart' as Colour;

class MobileGameAssitant extends StatelessWidget {
  const MobileGameAssitant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Scaffold(
        backgroundColor: Colour.AppColours.blueBackground,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 0),
              child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('Pressed');
                      },
                      child: Container(
                        child: const CircleAvatar(
                          backgroundImage:
                              ExactAssetImage('assets/images/person.jpeg'),
                        ),
                        padding: const EdgeInsets.all(2.0), // borde width
                        decoration: BoxDecoration(
                          color: Colors.white, // border color
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  ]),
            ),
          ],
          backgroundColor: Colour.AppColours.blueBackground,
          title: Text(
            "Game Creator",
            style: TextStyle(
                fontSize: 30,
                color: Colour.AppColours.bodyTextColor,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

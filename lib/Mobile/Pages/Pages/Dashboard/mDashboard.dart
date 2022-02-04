import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Pages/Assets/colours.dart' as Colour;

class MobileDashboard extends StatelessWidget {
  const MobileDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.AppColours.blueBackground,
      body: Center(
        child: Text(
          "Dashboard",
          style: TextStyle(color: Colour.AppColours.bodyTextColor),
        ),
      ),
      //   padding: const EdgeInsets.only(
      //     left: 10,
      //     right: 10,
      //     top: 10,
      //   ),
      //   child: Scaffold(
      //     backgroundColor: Colour.AppColours.blueBackground,
      //     appBar: PreferredSize(
      //       preferredSize: Size.fromHeight(200),
      //       child: AppBar(
      //         // actions: [
      //         //   Padding(
      //         //     padding: const EdgeInsets.only(top: 0),
      //         //     child: Row(
      //         //         // mainAxisSize: MainAxisSize.min,
      //         //         // mainAxisAlignment: MainAxisAlignment.center,
      //         //         children: [
      //         //           GestureDetector(
      //         //             onTap: () {
      //         //               print('Pressed');
      //         //             },
      //         //             child: Container(
      //         //               child: const CircleAvatar(
      //         //                 radius: 25,
      //         //                 backgroundImage:
      //         //                     ExactAssetImage('assets/images/darshil.png'),
      //         //               ),
      //         //               padding: const EdgeInsets.all(1.0), // borde width
      //         //               decoration: BoxDecoration(
      //         //                 color: Colors.white, // border color
      //         //                 shape: BoxShape.circle,
      //         //               ),
      //         //             ),
      //         //           )
      //         //         ]),
      //         //   ),
      //         // ],
      //         backgroundColor: Colour.AppColours.blueBackground,
      //         title: Text(
      //           "Dashboard",
      //           textAlign: TextAlign.center,
      //           style: TextStyle(
      //               fontSize: 30,
      //               color: Colour.AppColours.bodyTextColor,
      //               fontWeight: FontWeight.w700),
      //         ),
      //       ),
      //     ),
      //   ),
    );
  }
}

//   Widget fixturesBox() {
//     return Scaffold();
//   }
// }

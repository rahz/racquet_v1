import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Pages/Assets/themes.dart' as colour;
import 'package:racquet_v1/Mobile/Pages/MobilePages/Dashboard/Widgets/Introductory_name.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Dashboard/Widgets/latest_c_results.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Dashboard/Widgets/my_club.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Dashboard/Widgets/next_match.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Dashboard/Widgets/Latest_p_results.dart';

class MobileDashboard extends StatelessWidget {
  const MobileDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        // backgroundColor: colour.AppColours.blueBackground,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 150, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GreetingMessage(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 170, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Rahul Khimani",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 30)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NextMatchDashboardBox(),
                  SizedBox(width: 30),
                  MyClubDashboardBox(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LatestPlayerResultsBox(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LatestClubResultsBox(),
                ],
              ),
            ),
          ],
        ),
      );
}

// class MobileDashboardv2 extends StatelessWidget {
//   const MobileDashboardv2({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Column(children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 20, top: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   GreetingMessage(),
//                 ],
//               ),
//             ),
//           ]),
//           Expanded(
//             child: ListView.builder(
//               itemCount: 1,
//               itemBuilder: ((context, index) {
//                 return Padding(
//                   padding: EdgeInsets.only(top: 10),
//                   child: Container(
//                     color: Colors.deepPurple[400],
//                     height: 120,
//                   ),
//                 );
//               }),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: 1,
//               itemBuilder: ((context, index) {
//                 return Padding(
//                   padding: EdgeInsets.only(top: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       NextMatchDashboardBox(),
//                       SizedBox(width: 20),
//                       MyClubDashboardBox(),
//                     ],
//                   ),
//                 );
//               }),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

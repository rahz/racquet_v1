// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Game%20Creator/mGame.dart';

class LiveTourneyScreen extends StatelessWidget {
  final List? PlayersUID;
  final int NumberOfPlayers;
  final int NumberOfCourts;
  LiveTourneyScreen(
      {Key? key,
      required this.PlayersUID,
      required this.NumberOfPlayers,
      required this.NumberOfCourts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var shuffledPlayers = (PlayersUID!..shuffle());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).backgroundColor,
          ),
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => MobileGameBuilder()));
          },
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> users) {
              if (users.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              // return Text('Hi');
              return Column(
                children: <Widget>[
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: PlayersUID!.length,
                      itemBuilder: (ctx, index) {
                        var snap = users.data!.docs[index].data();
                        return StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("users")
                                .doc(shuffledPlayers[index])
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<DocumentSnapshot> userFromUID) {
                              if (!users.hasData) {
                                return CircularProgressIndicator();
                              } else {
                                return Text(index.toString() +
                                    ' ' +
                                    userFromUID.data!['forename'] +
                                    ' ' +
                                    userFromUID.data!['surname']);
                              }
                            });
                      }),
                  Text(
                    PlayersUID.toString(),
                    textAlign: TextAlign.center,
                  )
                ],
              );
            })

        // body: Text(PlayersUID.toString()),
        );
  }
}

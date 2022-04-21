import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Dashboard/mDashboard.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Game%20Creator/mGame.dart';
import 'package:racquet_v1/Mobile/mobileMainv2.dart';

class ListOfCurrentTournaments extends StatelessWidget {
  const ListOfCurrentTournaments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Select a tournament...')),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => MobileAppStateful()));
        }),
        body: Column(children: [
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('tournaments')
                  .snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snap.data!.docs.length,
                    itemBuilder: (ctx, index) {
                      var tournament_db = snap.data!.docs[index].data();
                      int num = tournament_db['numofplayers'];

                      return Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: ExpansionTile(
                              iconColor: Theme.of(context).backgroundColor,
                              textColor: Theme.of(context).backgroundColor,
                              backgroundColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.8),
                              collapsedBackgroundColor:
                                  Theme.of(context).primaryColor,
                              title: Text(tournament_db['name'].toString()),
                              subtitle: Text(DateFormat('MM/dd/yyyy').format(
                                  (tournament_db['Date Created'] as Timestamp)
                                      .toDate())),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, bottom: 3),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Number of Players: ' + num.toString(),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Number of Courts: ' +
                                            tournament_db['courts'].toString(),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, bottom: 3),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Completed? ',
                                        textAlign: TextAlign.start,
                                      ),
                                      tournament_db['completed?']
                                          ? Icon(
                                              Icons.check,
                                              size: 19,
                                            )
                                          : Icon(
                                              Icons.block,
                                              size: 19,
                                            )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    width: 500,
                                    height: 200,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount: num,
                                          itemBuilder: ((ctx, index) {
                                            return StreamBuilder(
                                                stream: FirebaseFirestore
                                                    .instance
                                                    .collection('users')
                                                    .doc(tournament_db[
                                                            'listofplayersuid']
                                                        [index])
                                                    .snapshots(),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot<
                                                            DocumentSnapshot>
                                                        snapshot2) {
                                                  if (!snapshot2.hasData) {
                                                    return CircularProgressIndicator();
                                                  } else {
                                                    return StreamBuilder(
                                                        stream:
                                                            FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'clubs')
                                                                .doc(snapshot2
                                                                        .data![
                                                                    'Club UID'])
                                                                .snapshots(),
                                                        builder: (BuildContext
                                                                context,
                                                            AsyncSnapshot<
                                                                    DocumentSnapshot>
                                                                club) {
                                                          if (!club.hasData) {
                                                            return CircularProgressIndicator();
                                                          } else {
                                                            return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Card(
                                                                    margin: EdgeInsets.symmetric(
                                                                        vertical:
                                                                            15),
                                                                    color: Theme.of(
                                                                            context)
                                                                        .backgroundColor
                                                                        .withOpacity(
                                                                            0.7),
                                                                    child: Center(
                                                                        child: Padding(
                                                                            padding: const EdgeInsets.all(4.0),
                                                                            child: Column(
                                                                              children: [
                                                                                CircleAvatar(
                                                                                  backgroundImage: NetworkImage(snapshot2.data!['ppURL']),
                                                                                  radius: 40,
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 20,
                                                                                ),
                                                                                Row(
                                                                                  children: [
                                                                                    Text(snapshot2.data!['forename']),
                                                                                    Text(' '),
                                                                                    Text(snapshot2.data!['surname'])
                                                                                  ],
                                                                                ),
                                                                                Text(club.data!['Club Abr']),
                                                                              ],
                                                                            )))));
                                                          }
                                                        });
                                                  }
                                                });
                                          })),
                                    ))
                              ]));
                    });
              })
        ]));
  }
}

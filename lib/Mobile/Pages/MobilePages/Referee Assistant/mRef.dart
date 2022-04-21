// ignore_for_file: file_names, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../Logic/Utilities/snackbar.dart';

class MobileRef extends StatefulWidget {
  final String matchid;
  const MobileRef({Key? key, required this.matchid}) : super(key: key);

  @override
  State<MobileRef> createState() => _MobileRefState();
}

court() {
  return Stack(
    children: [
      Image.asset(
        'assets/images/badminton_court.jpeg',
      ),
    ],
  );
}

class _MobileRefState extends State<MobileRef> {
  var matchDB = {};
  bool isLoading = false;
  bool isPressed = false;
  var p1data = {};
  var p2data = {};

  @override
  void initState() {
    super.initState();
    getMDoc();
  }

  getMDoc() async {
    setState(() {
      isLoading = true;
    });
    try {
      var clubIDFromDatabase = await FirebaseFirestore.instance
          .collection("matches")
          .where('matchUID', isEqualTo: widget.matchid)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          matchDB = result.data();
          print(result.data());
        });
      });

      var p1dataraw = await FirebaseFirestore.instance
          .collection('users')
          .doc(matchDB['player1uid'])
          .collection('statistics')
          .doc(matchDB['player1uid'])
          .get();

      var p2dataraw = await FirebaseFirestore.instance
          .collection('users')
          .doc(matchDB['player2uid'])
          .collection('statistics')
          .doc(matchDB['player2uid'])
          .get();
      p1data = p1dataraw.data()!;
      p2data = p2dataraw.data()!;
      print(p1data);
      print(p2data);
    } catch (err) {
      showSnackBar(err.toString(), context);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _p1;
    var _p2;

    var inc1 = matchDB['player1score1'];
    var inc2 = matchDB['player2score1'];
    var incace1 = p1data['aces'];
    var inctp1 = p1data['Total Points Won'];
    var inctl1 = p1data['Total Points Lost'];
    var incace2 = p2data['aces'];
    var inctp2 = p2data['Total Points Won'];
    var inctl2 = p2data['Total Points Lost'];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_back,
          color: Theme.of(context).backgroundColor,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: GestureDetector(
          onTap: (() {}),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                matchDB['player1score1'].toString() +
                    ' - ' +
                    matchDB['player2score1'].toString(),
                style: TextStyle(fontSize: 52),
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  court(),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('matches')
                          .snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                              snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        // return Text('Hi');
                        return ListView.builder(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (ctx, index) {
                              var snap = snapshot.data!.docs[index].data();

                              return StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(snap['player1uid'])
                                      .snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<DocumentSnapshot>
                                          snapshot2) {
                                    if (!snapshot2.hasData) {
                                      return CircularProgressIndicator();
                                    } else {
                                      // return Image.network(
                                      //   snapshot2.data!['ppURL'],
                                      //   // fit: BoxFit.none,
                                      //   width: 50,
                                      //   height: 80,
                                      // );
                                      return ListView.builder(
                                          padding: EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemCount: snapshot.data!.docs.length,
                                          itemBuilder: (ctx, index) {
                                            _p1 == snapshot2;
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 200.0, top: 85),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      width: 60.0,
                                                      height: 54.0,
                                                      decoration: new BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image: new DecorationImage(
                                                              fit: BoxFit
                                                                  .fitHeight,
                                                              image: new NetworkImage(
                                                                  snapshot2
                                                                          .data![
                                                                      'ppURL'])))),
                                                  Text(snapshot2
                                                              .data!['forename']
                                                          [0] +
                                                      '. ' +
                                                      snapshot2
                                                          .data!['surname'])
                                                ],
                                              ),
                                            );
                                          });
                                    }
                                  });
                            });
                      }),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('matches')
                          .snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                              snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        // return Text('Hi');
                        return ListView.builder(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (ctx, index) {
                              var snap = snapshot.data!.docs[index].data();

                              return StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(snap['player2uid'])
                                      .snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<DocumentSnapshot>
                                          snapshot2) {
                                    if (!snapshot2.hasData) {
                                      return CircularProgressIndicator();
                                    } else {
                                      // return Image.network(
                                      //   snapshot2.data!['ppURL'],
                                      //   // fit: BoxFit.none,
                                      //   width: 50,
                                      //   height: 80,
                                      // );
                                      return Padding(
                                        padding:
                                            EdgeInsets.only(left: 200, top: 15),
                                        child: ListView.builder(
                                            padding: EdgeInsets.only(
                                                top: 5, bottom: 5),
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            itemCount:
                                                snapshot.data!.docs.length,
                                            itemBuilder: (ctx, index) {
                                              return Column(
                                                children: [
                                                  Container(
                                                      width: 70.0,
                                                      height: 54.0,
                                                      decoration: new BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image: new DecorationImage(
                                                              fit: BoxFit
                                                                  .contain,
                                                              image: new NetworkImage(
                                                                  snapshot2
                                                                          .data![
                                                                      'ppURL'])))),
                                                  Text(snapshot2
                                                              .data!['forename']
                                                          [0] +
                                                      '. ' +
                                                      snapshot2
                                                          .data!['surname'])
                                                ],
                                              );
                                            }),
                                      );
                                    }
                                  });
                            });
                      }),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (() {
                      FirebaseFirestore.instance
                          .collection('matches')
                          .doc('WPkfyp1P8B8fxcihzBvc')
                          .update({'player1score1': inc1 + 1});
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(matchDB['player1uid'])
                          .collection('statistics')
                          .doc(matchDB['player1uid'])
                          .update({'Total Points Won': inctp1 + 1});
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(matchDB['player2uid'])
                          .collection('statistics')
                          .doc(matchDB['player2uid'])
                          .update({'Total Points Lost': inctl2 + 1});
                      getMDoc();
                    }),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Point Won",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (() {
                      FirebaseFirestore.instance
                          .collection('matches')
                          .doc('WPkfyp1P8B8fxcihzBvc')
                          .update({'player2score1': inc2 + 1});
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(matchDB['player2uid'])
                          .collection('statistics')
                          .doc(matchDB['player2uid'])
                          .update({'Total Points Won': inctp2 + 1});
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(matchDB['player1uid'])
                          .collection('statistics')
                          .doc(matchDB['player1uid'])
                          .update({'Total Points Lost': inctl1 + 1});
                      getMDoc();
                    }),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Point Won",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (() {
                      FirebaseFirestore.instance
                          .collection('matches')
                          .doc('WPkfyp1P8B8fxcihzBvc')
                          .update({'player1score1': inc1 + 1});
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(matchDB['player1uid'])
                          .collection('statistics')
                          .doc(matchDB['player1uid'])
                          .set({'aces': incace1 + 1});
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(matchDB['player1uid'])
                          .collection('statistics')
                          .doc(matchDB['player1uid'])
                          .update({'Total Points Won': inctp1 + 1});
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(matchDB['player2uid'])
                          .collection('statistics')
                          .doc(matchDB['player2uid'])
                          .update({'Total Points Lost': inctl2 + 1});
                      getMDoc();
                    }),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Ace!",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (() {
                      FirebaseFirestore.instance
                          .collection('matches')
                          .doc('WPkfyp1P8B8fxcihzBvc')
                          .update({'player2score1': inc2 + 1});
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(matchDB['player2uid'])
                          .collection('statistics')
                          .doc(matchDB['player2uid'])
                          .update({'aces': incace2 + 1});
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(matchDB['player2uid'])
                          .collection('statistics')
                          .doc(matchDB['player2uid'])
                          .update({'Total Points Won': inctp2 + 1});
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(matchDB['player1uid'])
                          .collection('statistics')
                          .doc(matchDB['player1uid'])
                          .update({'Total Points Lost': inctl1 + 1});
                      getMDoc();
                    }),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Ace!",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: file_names, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:racquet_v1/Mobile/Logic/Utilities/snackbar.dart';
import 'package:racquet_v1/Mobile/LookUpClub.dart';
import 'package:racquet_v1/Mobile/RegScreen.dart';

class ClubConfirmScreen extends StatefulWidget {
  final int clubID;
  final String clubPass;
  const ClubConfirmScreen(
    this.clubID,
    this.clubPass, {
    Key? key,
  }) : super(key: key);

  @override
  State<ClubConfirmScreen> createState() => _ClubConfirmScreenState();
}

class _ClubConfirmScreenState extends State<ClubConfirmScreen> {
  final firestore = FirebaseFirestore.instance;
  bool isLoading = false;
  bool isPressed = false;
  var clubDB = {};
  var clubDatabase = {};

  @override
  void initState() {
    super.initState();
    getClubDoc();
  }

  getClubDoc() async {
    setState(() {
      isLoading = true;
    });
    try {
      var clubIDFromDatabase = await FirebaseFirestore.instance
          .collection("clubs")
          .where("Club ID", isEqualTo: widget.clubID)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          clubDB = result.data();
          print(result.data());
        });
      });

      var clubData = await FirebaseFirestore.instance
          .collection("clubs")
          .doc(clubDB['uid'])
          .get();

      clubDatabase = clubData.data()!;
    } catch (err) {
      showSnackBar(err.toString(), context);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Icon(
                Icons.arrow_forward,
                color: Theme.of(context).backgroundColor,
              ),
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {},
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Inputted from last screen: " + widget.clubID.toString(),
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    "Inputted from last screen: " + widget.clubPass,
                    style: TextStyle(fontSize: 14),
                  ),
                  Text("From Firebase"),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 100,
                    child: Image.network(clubDB['Club Logo']),
                  ),
                  Text(clubDatabase['Club Abr']),
                  Text(clubDatabase['Club Name']),
                  Text(clubDB['Club Pass']),
                  Text(clubDB['uid']),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => LookUpClubScreen()));
                        },
                        color: Colors.red[300],
                        child: Icon(LineAwesomeIcons.times),
                      ),
                      SizedBox(width: 30),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => RegScreen(
                                        clubDB['Club ID'],
                                        clubDB['uid'],
                                      )));
                        },
                        color: Colors.green[300],
                        child: Icon(LineAwesomeIcons.check),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
  }
}

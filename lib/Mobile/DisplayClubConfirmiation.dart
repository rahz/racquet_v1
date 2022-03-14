// ignore_for_file: file_names, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:racquet_v1/Mobile/LogInScreen.dart';
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
            //
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Center(
              child: Container(
                height: 450,
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5,
                      )
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      "Confirm Club",
                      style: TextStyle(fontSize: 36),
                    ),
                    SizedBox(height: 50),
                    SizedBox(
                      //height: 160,
                      width: MediaQuery.of(context).size.width - 80,
                      child: Image.network(
                        clubDatabase['Club Logo'],
                        scale: 0.5,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      clubDatabase['Club Abr'],
                      style: TextStyle(fontSize: 26),
                    ),
                    Text(
                      clubDatabase['Club Name'],
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      height: 50,
                    ),
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
            ),
          );
  }
}

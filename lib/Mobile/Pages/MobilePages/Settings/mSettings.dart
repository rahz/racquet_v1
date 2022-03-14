// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Widgets.dart';

class MobileSettings extends StatefulWidget {
  const MobileSettings({Key? key}) : super(key: key);

  @override
  State<MobileSettings> createState() => _MobileSettingsState();
}

class _MobileSettingsState extends State<MobileSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          children: [
            Row(
              children: [
                Text("Use Dark Mode:"),
                SwitchThemeButton(),
              ],
            ),
            Text(
              "Debugger Log and Info",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            Text("Email: " + emailData()),
            Text("UID: " + uidData()),
          ],
        ));
  }

// Check if the user is signed in

  String uidData() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String uid = user.uid;
      return uid.toString();
    } else {
      return "error";
    }
  }

  String emailData() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String? email = user.email;
      return email.toString();
    } else {
      return "error";
    }
  }
}

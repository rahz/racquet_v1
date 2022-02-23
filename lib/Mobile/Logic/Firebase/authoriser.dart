import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:racquet_v1/Mobile/Logic/Firebase/storage_manager.dart';
import 'package:racquet_v1/Mobile/Logic/Firebase/usermodel.dart';

class Authoriser {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getPlayerDetails() async {
    User currentPlayer = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentPlayer.uid).get();
    return UserModel.fromSnap(snap);
  }

  Future<String> signUpPlayer({
    required String forename,
    required String surname,
    required String email,
    required String password,
    required String phoneNo,
    required Uint8List ProfilePicture,
  }) async {
    String resolve = "Error has occured";
    try {
      if (forename.isNotEmpty ||
          surname.isNotEmpty ||
          email.isNotEmpty ||
          password.isNotEmpty ||
          phoneNo.isNotEmpty ||
          ProfilePicture != null) {
        // adds user to auth
        UserCredential creds = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String ppURL = await StorageMethods()
            .uploadImageToStorage('Profile Pictures', ProfilePicture, false);

        //add user to database

        UserModel user = UserModel(
            uid: creds.user!.uid,
            forename: forename,
            surname: surname,
            email: email,
            phoneNo: phoneNo,
            ppURL: ppURL);

        await _firestore
            .collection('users')
            .doc(creds.user!.uid)
            .set(user.toJson());
        resolve = "Task Successful";
      }
    } catch (error) {
      resolve = error.toString();
    }
    return resolve;
  }

  // Future<String> signIn(String email, String password) async {
  //   if (_formKey.currentState!.validate()) {
  //     await _auth
  //         .signInWithEmailAndPassword(email: email, password: password)
  //         .then((uid) => {
  //               Fluttertoast.showToast(msg: "Login Succesful"),
  //               Navigator.pushReplacement(
  //                   context,
  //                   MaterialPageRoute(
  //                       builder: (context) => MobileAppStateful()))
  //             })
  //         .catchError((error) {
  //       Fluttertoast.showToast(msg: error!.message);
  //     });
  //   }
  // }
  Future<String> signIn({
    required String username,
    required String password,
  }) async {
    String res = "error has occured";

    try {
      if (username.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: username, password: password);
        res = "Task Successful";
      } else {
        res = "Enter";
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }
}

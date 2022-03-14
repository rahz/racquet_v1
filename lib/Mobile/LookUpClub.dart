// ignore_for_file: prefer_const_constructors, file_names
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:racquet_v1/Mobile/DisplayClubConfirmiation.dart';
import 'package:racquet_v1/Mobile/Logic/Firebase/clubmodel.dart';

import 'package:racquet_v1/Mobile/Logic/Utilities/Image_Picker.dart';

import 'LogInScreen.dart';
import 'Logic/Utilities/snackbar.dart';

class LookUpClubScreen extends StatefulWidget {
  const LookUpClubScreen({Key? key}) : super(key: key);

  @override
  _LookUpClubScreenState createState() => _LookUpClubScreenState();
}

class _LookUpClubScreenState extends State<LookUpClubScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _clubIDController = TextEditingController();
  final TextEditingController _clubPassController = TextEditingController();
  bool _isLoading = false;
  final _auth = FirebaseAuth.instance;

  final firestore = FirebaseFirestore.instance;
  bool isLoading = false;
  bool isValid = true;
  var clubDB = {};
  var clubDatabase = {};

  @override
  void initState() {
    super.initState();
    //build(context);
    //getClubDoc();
  }

  Future<bool> getClubDoc(clubID, rawClubID, rawclubPass) async {
    clubDB.toString;
    setState(() {
      isLoading = true;
    });

    try {
      var clubIDFromDatabase = await FirebaseFirestore.instance
          .collection("clubs")
          .where("Club ID", isEqualTo: clubID)
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

      if (_clubPassController.text == clubDatabase['Club Pass']) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ClubConfirmScreen(rawClubID, rawclubPass);
          }),
        );
        return true;
      } else {
        showSnackBar("Club Password does not correlate with this ID", context);
        return false;
      }
    } catch (err) {
      showSnackBar(err.toString(), context);
    }
    setState(() {
      isLoading = false;
    });
    return false;
  }

  void dispose() {
    super.dispose();
    _clubIDController.dispose();
    _clubPassController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //int clubIDInputted = int.parse(_clubIDController.text);
    final ClubIDInput = TextFormField(
      autofocus: false,
      controller: _clubIDController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Club ID cannot be blank.");
        }
      },
      onSaved: (value) {
        _clubIDController.text = value!;
        int clubIDInputted = int.parse(_clubIDController.text);
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        hintText: "Club ID",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final clubPassInput = TextFormField(
      autofocus: false,
      controller: _clubPassController,
      obscureText: true,
      //validator
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Club Pass cannot be blank.");
        }
        if (!regex.hasMatch(value)) {
          return ("Please enter a valid password");
        }
      },
      onSaved: (value) {
        _clubPassController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        hintText: "Club Pass",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final SignUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      color: Theme.of(context).primaryColor,
      child: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).backgroundColor,
              ),
            )
          : isValid
              ? MaterialButton(
                  padding: EdgeInsets.all(10),
                  onPressed: () async {
                    int clubIDInputted = int.parse(_clubIDController.text);
                    String clubPassInput = _clubPassController.text;
                    getClubDoc(clubIDInputted, clubIDInputted, clubPassInput);
                    // _clubIDController.dispose();
                    // _clubPassController.dispose();
                    print(clubDatabase['Club Pass']);
                  },
                  child: Text("Look up your Club"),
                )
              : Center(
                  child: MaterialButton(
                    onPressed: () {},
                  ),
                ),
    );
    return Scaffold(
      persistentFooterButtons: [
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              // background color
              primary: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (builder) => LoginScreen()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).backgroundColor,
            ),
            label: Text(
              'Login Instead',
              style: TextStyle(color: Theme.of(context).backgroundColor),
            )),
      ],
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
            child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 70,
                    child: Text(
                      "RacQuet",
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ClubIDInput,
                  SizedBox(
                    height: 25,
                  ),
                  clubPassInput,
                  SizedBox(
                    height: 25,
                  ),
                  SignUpButton,
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}

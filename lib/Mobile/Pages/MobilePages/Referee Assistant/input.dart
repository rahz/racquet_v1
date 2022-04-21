// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:racquet_v1/Mobile/Logic/Firebase/authoriser.dart';
import 'package:racquet_v1/Mobile/Logic/Utilities/snackbar.dart';
import 'package:racquet_v1/Mobile/LookUpClub.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Dashboard/mDashboard.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Referee%20Assistant/mRef.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Settings/Widgets.dart';
import 'package:racquet_v1/Mobile/RegScreen.dart';
import 'package:racquet_v1/Mobile/mobileMainv2.dart';
import 'package:racquet_v1/TabletApp/tabWelcome.dart';
import 'package:racquet_v1/WebApp/webWelcome.dart';
import 'package:racquet_v1/main.dart';
import 'package:racquet_v1/responsive_layout.dart';

class RegScreenInput extends StatefulWidget {
  const RegScreenInput({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegScreenInput> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  final _auth = FirebaseAuth.instance;
  var matchDB = {};

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  void signIn() async {
    setState(() {
      _isLoading = true;
    });
    try {
      var clubIDFromDatabase = await FirebaseFirestore.instance
          .collection("matches")
          .where('matchUID', isEqualTo: _usernameController.text)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          matchDB = result.data();
          print(result.data());
        });
      });

      if (_usernameController.text == matchDB['matchUID']) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => MobileRef(matchid: matchDB['matchUID'])),
          ),
        );
      }
    } catch (err) {
      showSnackBar(err.toString(), context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final emailInput = TextFormField(
      autofocus: false,
      controller: _usernameController,
      keyboardType: TextInputType.text,
      //validator
      onSaved: (value) {
        _usernameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        contentPadding: EdgeInsets.all(10),
        hintText: "Match ID",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      color: Theme.of(context).primaryColor,
      child: _isLoading
          ? Center(
              child: CircularProgressIndicator(
              color: Theme.of(context).backgroundColor,
            ))
          : MaterialButton(
              padding: EdgeInsets.all(10),
              onPressed: signIn,
              child: Text("Login"),
            ),
    );
    return Scaffold(
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  emailInput,

                  SizedBox(
                    height: 25,
                  ),
                  loginButton,
                  SizedBox(
                    height: 20,
                  ),
                  // signup using club id and club password
                ],
              ),
            ),
          ),
        )),
      ),
      floatingActionButton: LoginScreenThemeSwitch(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}

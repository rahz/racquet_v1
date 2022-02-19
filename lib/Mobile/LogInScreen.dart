// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Dashboard/mDashboard.dart';
import 'package:racquet_v1/Mobile/mobileMainv2.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final emailInput = TextFormField(
      autofocus: false,
      controller: usernameController,
      keyboardType: TextInputType.emailAddress,
      //validator
      onSaved: (value) {
        usernameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        contentPadding: EdgeInsets.all(10),
        hintText: "E-mail Address",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final passwordInput = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      //validator
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        contentPadding: EdgeInsets.all(10),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      color: Colors.amber,
      child: MaterialButton(
        padding: EdgeInsets.all(10),
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => MobileAppStateful()));
        },
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
                    height: 150,
                    child: Text(
                      "RacQuet",
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  emailInput,
                  SizedBox(
                    height: 10,
                  ),
                  passwordInput,
                  SizedBox(
                    height: 25,
                  ),
                  loginButton,
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}

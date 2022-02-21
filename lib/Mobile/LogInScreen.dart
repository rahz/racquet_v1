// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final emailInput = TextFormField(
      autofocus: false,
      controller: usernameController,
      keyboardType: TextInputType.emailAddress,
      //validator
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter an e-mail");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid e-mail");
        }
        return null;
      },
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
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password cannot be blank.");
        }
        if (!regex.hasMatch(value)) {
          return ("Please enter a valid password");
        }
      },
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
          signin(usernameController.text, passwordController.text);
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

  void signin(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Succesful"),
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MobileAppStateful()))
              })
          .catchError((error) {
        Fluttertoast.showToast(msg: error!.message);
      });
    }
  }
}

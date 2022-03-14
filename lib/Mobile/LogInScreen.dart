// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:racquet_v1/Mobile/Logic/Firebase/authoriser.dart';
import 'package:racquet_v1/Mobile/Logic/Utilities/snackbar.dart';
import 'package:racquet_v1/Mobile/LookUpClub.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Dashboard/mDashboard.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Settings/Widgets.dart';
import 'package:racquet_v1/Mobile/RegScreen.dart';
import 'package:racquet_v1/Mobile/mobileMainv2.dart';
import 'package:racquet_v1/TabletApp/tabWelcome.dart';
import 'package:racquet_v1/WebApp/webWelcome.dart';
import 'package:racquet_v1/main.dart';
import 'package:racquet_v1/responsive_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  final _auth = FirebaseAuth.instance;

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
    String res = await Authoriser().signIn(
        username: _usernameController.text, password: _passwordController.text);

    if (res == "Task Successful") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: ((context) => ResponsiveLayout(
                mobileHome: MobileAppStateful(),
                tabletHome: tabletWelcome(),
                webHome: WebWelcome(),
              )),
        ),
      );
    } else {
      showSnackBar(res, context);
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
        _usernameController.text = value!;
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
      controller: _passwordController,
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
        _passwordController.text = value!;
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
                    height: 20,
                  ),
                  // signup using club id and club password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text("use your club information to "),
                        padding: EdgeInsets.symmetric(vertical: 8),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LookUpClubScreen()));
                        },
                        child: Container(
                          child: Text(
                            "sign up.",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  )
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

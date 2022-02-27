// ignore_for_file: prefer_const_constructors, file_names
import 'dart:typed_data';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:racquet_v1/Mobile/Logic/Firebase/authoriser.dart';
import 'package:racquet_v1/Mobile/Logic/Utilities/Image_Picker.dart';
import 'package:racquet_v1/Mobile/Logic/Utilities/snackbar.dart';
import 'package:racquet_v1/Mobile/mobileMainv2.dart';
import 'package:http/http.dart' as http;
import '../TabletApp/tabWelcome.dart';
import '../WebApp/webWelcome.dart';
import '../responsive_layout.dart';

class RegScreen extends StatefulWidget {
  final int clubID;
  final String clubUID;
  const RegScreen(this.clubID, this.clubUID, {Key? key}) : super(key: key);

  @override
  _RegScreenState createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _forenameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneNOController = TextEditingController();
  final TextEditingController _clubIDController = TextEditingController();

  Uint8List? _profilePic;
  bool _isLoading = false;
  final _auth = FirebaseAuth.instance;

  void initState() {
    super.initState();
    //CheckPPnotVoid();
  }

  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _forenameController.dispose();
    _surnameController.dispose();
    _phoneNOController.dispose();
    _clubIDController.dispose();
  }

  ProfilePicChooser() async {
    Uint8List? pp = await ChooseImage(ImageSource.gallery);

    if (pp != null) {
      setState(() {
        _profilePic = pp;
      });
    }
    if (pp == null) {
      Uint8List pp = (await rootBundle.load('assets/images/default.jpeg'))
          .buffer
          .asUint8List();
      setState(() {
        _profilePic = pp;
      });
    }
  }

  void CheckPPnotVoid() {
    if (_profilePic != null) {
      SignUpPlayer();
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Missing Information"),
          content: Text("Please select a valid profile picture!"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Close"))
          ],
        ),
      );
      //build(context);
    }
  }

  void SignUpPlayer() async {
    setState(() {
      _isLoading = true;
    });

    String res = await Authoriser().signUpPlayer(
      clubID: widget.clubID,
      clubUID: widget.clubUID,
      forename: _forenameController.text,
      surname: _surnameController.text,
      email: _usernameController.text,
      password: _passwordController.text,
      phoneNo: _phoneNOController.text,
      ProfilePicture: _profilePic!,
    );
    setState(() {
      _isLoading = false;
    });
    if (res != 'Task Successful') {
      showSnackBar(res, context);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => ResponsiveLayout(
                mobileHome: MobileAppStateful(),
                tabletHome: tabletWelcome(),
                webHome: WebWelcome(),
              )),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final forenameInput = TextFormField(
      autofocus: false,
      controller: _forenameController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        _forenameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "Forename",
        contentPadding: EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final surnameInput = TextFormField(
      autofocus: false,
      controller: _surnameController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        _surnameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "Surname",
        contentPadding: EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final clubIDInput = TextFormField(
      autofocus: false,
      controller: _clubIDController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        _clubIDController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "Club ID",
        contentPadding: EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final phoneNOInput = TextFormField(
      autofocus: false,
      controller: _phoneNOController,
      keyboardType: TextInputType.phone,
      onSaved: (value) {
        _phoneNOController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "Phone Number (Start with 0)",
        contentPadding: EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

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
        contentPadding: EdgeInsets.all(10),
        hintText: "Password",
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
          : MaterialButton(
              padding: EdgeInsets.all(10),
              onPressed: CheckPPnotVoid,
              child: Text("Sign Up"),
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
                  Stack(
                    children: [
                      _profilePic != null
                          ? CircleAvatar(
                              radius: 64,
                              backgroundImage: MemoryImage(_profilePic!))
                          : CircleAvatar(
                              radius: 64,
                              backgroundImage: NetworkImage(
                                  'https://img.search.brave.com/rLCJjrapLFuJ89iLEusF3IkULLOHmhlX0XC9saUuE8A/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly93d3cu/c2FsaXNidXJ5dXQu/Y29tL3dwLWNvbnRl/bnQvdXBsb2Fkcy8y/MDIwLzA5L2F2YXRh/ci0xLTIwNDh4MjA0/OC5qcGVn')),
                      Positioned(
                        bottom: -13,
                        left: 90,
                        child: IconButton(
                          icon: Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.white,
                          ),
                          onPressed: ProfilePicChooser,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  forenameInput,
                  SizedBox(
                    height: 10,
                  ),
                  surnameInput,
                  SizedBox(
                    height: 10,
                  ),
                  clubIDInput,
                  SizedBox(
                    height: 10,
                  ),
                  emailInput,
                  SizedBox(
                    height: 10,
                  ),
                  passwordInput,
                  SizedBox(
                    height: 10,
                  ),
                  phoneNOInput,
                  SizedBox(
                    height: 25,
                  ),
                  SignUpButton,
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_back,
          color: Theme.of(context).backgroundColor,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Missing Information"),
              content: Text("Please select a valid profile picture!"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Close"))
              ],
            ),
          );
        },
      ),
    );
  }
}

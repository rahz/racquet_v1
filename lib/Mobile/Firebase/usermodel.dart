import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? uid;
  String? forename;
  String? surname;
  String? email;

  UserModel({this.uid, this.forename, this.surname, this.email});

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      forename: map['forename'],
      surname: map['surname'],
      email: map['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'forename': forename,
      'surname': surname,
      'email': email,
    };
  }
}

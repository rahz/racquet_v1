import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? uid;
  final String? forename;
  final String? surname;
  final String? email;
  final String? phoneNo;
  final String? ppURL;

  const UserModel({
    required this.uid,
    required this.forename,
    required this.surname,
    required this.email,
    required this.phoneNo,
    required this.ppURL,
  });

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    //factory UserModel.fromMap(map) {
    return UserModel(
      uid: snapshot['uid'],
      forename: snapshot['forename'],
      surname: snapshot['surname'],
      email: snapshot['email'],
      phoneNo: snapshot['phoneNo'],
      ppURL: snapshot['ppURL'],
    );
    //}
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'forename': forename,
        'surname': surname,
        'email': email,
        'phoneNo': phoneNo,
        'ppURL': ppURL,
      };
}

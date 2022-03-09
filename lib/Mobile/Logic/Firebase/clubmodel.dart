import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ClubModel {
  final String? uid;
  final int club_id;
  final String? club_abr;
  final String? club_name;
  final String? club_pass;
  final String? club_logo;

  const ClubModel({
    required this.uid,
    required this.club_id,
    required this.club_abr,
    required this.club_name,
    required this.club_pass,
    required this.club_logo,
  });

  static ClubModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    //factory UserModel.fromMap(map) {
    return ClubModel(
      uid: snapshot['uid'],
      club_id: snapshot['Club ID'],
      club_abr: snapshot['Club Abr'],
      club_name: snapshot['Club Name'],
      club_pass: snapshot['Club Pass'],
      club_logo: snapshot['Club Logo'],
    );
    //}
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'Club ID': club_id,
        'Club Abr': club_abr,
        'Club Name': club_name,
        'Club Pass': club_pass,
        'Club Logo': club_logo,
      };
}

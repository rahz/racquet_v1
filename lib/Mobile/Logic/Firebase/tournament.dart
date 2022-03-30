import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TournamentModel {
  final String? name;
  final String? uid;
  final int courts;
  final int numofplayers;
  final String? venue;
  final List? listofplayersuid;

  const TournamentModel({
    required this.uid,
    required this.courts,
    required this.numofplayers,
    required this.venue,
    required this.listofplayersuid,
    required this.name,
  });

  static TournamentModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return TournamentModel(
        uid: snapshot['uid'],
        courts: snapshot['courts'],
        numofplayers: snapshot['numofplayers'],
        venue: snapshot['venue'],
        listofplayersuid: snapshot['listofplayersuid'],
        name: snapshot['name']);
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'courts': courts,
        'numofplayers': numofplayers,
        'venue': venue,
        'listofplayersuid': listofplayersuid,
        'name': name,
      };
}

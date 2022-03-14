import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Logic/Firebase/authoriser.dart';
import 'package:racquet_v1/Mobile/Logic/Firebase/clubmodel.dart';
import 'package:racquet_v1/Mobile/Logic/Firebase/usermodel.dart';

class ClubProvider with ChangeNotifier {
  ClubModel? _club;
  final Authoriser _authoriser = Authoriser();

  ClubModel get getClub => _club!;

  Future<void> refreshClub() async {
    ClubModel club = await _authoriser.getClubDetails();
    _club = club;
    notifyListeners();
  }
}

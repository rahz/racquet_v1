import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Logic/Firebase/authoriser.dart';
import 'package:racquet_v1/Mobile/Logic/Firebase/clubmodel.dart';
import 'package:racquet_v1/Mobile/Logic/Firebase/usermodel.dart';

class UserProvider with ChangeNotifier {
  // UserModel?;
  UserModel? _user;
  final Authoriser _authoriser = Authoriser();

  UserModel get getUser => _user!;

  Future<void> refreshUser() async {
    UserModel? user = await _authoriser.getPlayerDetails();
    _user = user;
    notifyListeners();
  }
}

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

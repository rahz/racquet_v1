// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  // set isDarkMode(bool value) {
  //   isDarkMode = value;
  //   toggleTheme(value);
  //   notifyListeners();
  // }
}

class AppColours {
  // static Color blueBackground = const Color(0xFF080321);

  // static Color secondAccent = const Color(0xFF2b3369);
  // static Color bodyTextColor = const Color(0xFFFFFFFF);
  // static Color navButton = const Color(0xFF001086);

  static final darkTheme = ThemeData(
      backgroundColor: Colors.amber[700], // accent colour
      scaffoldBackgroundColor: Color(0xFF080321), // background colour
      colorScheme: ColorScheme.dark(),
      primaryColor: Color.fromARGB(255, 69, 35, 124), //widget colour
      splashColor: Color(0xFF001086),
      textTheme: TextTheme(
        bodyText2: TextStyle(
          color: Colors.white,
        ),
      ),
      iconTheme: IconThemeData(color: Colors.white));

  static final lightTheme = ThemeData(
      backgroundColor: Color.fromARGB(255, 252, 252, 252),
      scaffoldBackgroundColor: Color.fromARGB(255, 238, 238, 238),
      colorScheme: ColorScheme.light(),
      primaryColor: Color.fromARGB(255, 96, 212, 212),
      splashColor: Color.fromARGB(255, 34, 33, 33),
      textTheme: TextTheme(
        bodyText2: TextStyle(
          color: Colors.black,
        ),
      ),
      iconTheme: IconThemeData(color: Colors.black));
}

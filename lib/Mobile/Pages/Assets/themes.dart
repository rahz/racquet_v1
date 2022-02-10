import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class AppColours {
  static Color blueBackground = const Color(0xFF080321);

  static Color secondAccent = const Color(0xFF2b3369);
  static Color bodyTextColor = const Color(0xFFFFFFFF);
  static Color navButton = const Color(0xFF001086);

  static final darkTheme = ThemeData(
    backgroundColor: Colors.cyan[400],
    scaffoldBackgroundColor: Color(0xFF080321),
    colorScheme: ColorScheme.dark(),
    primaryColor: Color(0xFF2b3369),
    splashColor: Color(0xFF001086),
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: Colors.white,
      ),
    ),
  );

  static final lightTheme = ThemeData(
    backgroundColor: Color.fromARGB(255, 150, 0, 236),
    scaffoldBackgroundColor: Colors.grey[350],
    colorScheme: ColorScheme.light(),
    primaryColor: Colors.pink,
    splashColor: Colors.pink[700],
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: Colors.black,
      ),
    ),
  );
}

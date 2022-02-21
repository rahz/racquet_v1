// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:racquet_v1/Mobile/LogInScreen.dart';
import 'package:racquet_v1/TabletApp/tabWelcome.dart';

import 'package:racquet_v1/WebApp/webWelcome.dart';
import 'package:racquet_v1/responsive_layout.dart';

import 'Mobile/Pages/Assets/themes.dart';
import 'Mobile/mobileMainv2.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Racquet',
            themeMode: themeProvider.themeMode,
            theme: AppColours.lightTheme,
            darkTheme: AppColours.darkTheme,
            home: ResponsiveLayout(
                //mobileHome: MobileAppStateful(),
                mobileHome: LoginScreen(),
                tabletHome: tabletWelcome(),
                webHome: WebWelcome()),
          );
        },
      );
}

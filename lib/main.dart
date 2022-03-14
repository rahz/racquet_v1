// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:racquet_v1/Mobile/DisplayClubConfirmiation.dart';
import 'package:racquet_v1/Mobile/LogInScreen.dart';
import 'package:racquet_v1/Mobile/Logic/providers/userProvider.dart';
import 'package:racquet_v1/Mobile/LookUpClub.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Game%20Creator/Screens/Tournament/horizontalSelections.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Game%20Creator/Screens/Tournament/selections.dart';
import 'package:racquet_v1/TabletApp/tabWelcome.dart';

import 'package:racquet_v1/WebApp/webWelcome.dart';
import 'package:racquet_v1/responsive_layout.dart';

import 'Mobile/Logic/providers/clubProvider.dart';
import 'Mobile/Pages/Assets/themes.dart';
import 'Mobile/mobileMainv2.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDyQdbTP7idUQuVR8d90aH51wd_J5-66BU",
          appId: "1:1081987452776:web:665c3c50e3150096b690dd",
          messagingSenderId: "1081987452776",
          projectId: "racquet-fa2aa",
          storageBucket: "racquet-fa2aa.appspot.com"),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => UserProvider()),
              ChangeNotifierProvider(create: (_) => ClubProvider()),
            ],
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Racquet',
              themeMode: themeProvider.themeMode,
              theme: AppColours.lightTheme,
              darkTheme: AppColours.darkTheme,
              home: ResponsiveLayout(
                  // mobileHome: HorizontalSelectionsForTournament(),
                  mobileHome: LoginScreen(),
                  tabletHome: tabletWelcome(),
                  webHome: WebWelcome()),
            ),
          );
        },
      );
}

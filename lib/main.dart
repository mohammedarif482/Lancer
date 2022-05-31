// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lancer1/APIs/GoogleSignInApi.dart';
import 'package:lancer1/APIs/SignInAPI.dart';
import 'package:lancer1/Controller/Providers.dart';
import 'package:lancer1/View/Screens/Buyer/UserHome.dart';
import 'package:lancer1/View/Screens/Buyer/UserMain.dart';
import 'package:lancer1/View/Screens/Onboad.dart';
import 'package:lancer1/sharedPreference.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'APIs/GVerification.dart';
// import 'package:firebase_core/firebase_core.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SaveId.init();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => MainProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => GoogleController(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // MyApp({this.email});
  var id = SaveId.getId();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme:
              GoogleFonts.titilliumWebTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.blue,
        ),
        home: id == null ? OnBoard() : UserMain());
  }
}

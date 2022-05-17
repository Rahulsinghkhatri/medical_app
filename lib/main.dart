import 'package:flutter/material.dart';

import 'package:medical_app/screens/first_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyDbEj-KUMEUERHDuYBlggfXGEHZiToWp3E',
    appId: '1:117307051709:android:492f2a264b86993ce4b1d4',
    messagingSenderId: '117307051709',
    projectId: 'com.example.medical_app',
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //  themeMode: ThemeMode.light, //if here thememode.dark the it will be dark
      // debugShowCheckedModeBanner: false,

      // theme: MyTheme.LightTheme(context) ,
      //   // "/": (context) => LoginPageLightTheme(context),
      //   // darkTheme: MyTheme.darkTheme(context),

      // initialRoute: "firstScreen";
      // // routes(),
      // //   MyRoutes.homeRoute: (context) => HomePage(),
      // //   MyRoutes.loginRoute: (context) => firstScreen(),
      // // },
      theme: ThemeData(brightness: Brightness.light),
      home: firstScreen(),
    );
  }
}

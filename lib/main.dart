import 'package:flutter/material.dart';
import 'package:upper/Screens/categories.dart';
import 'package:upper/Screens/loading_screen.dart';
import 'package:upper/Screens/login.dart';
import 'package:upper/Screens/onboarding1.dart';
import 'package:upper/Screens/onboarding2.dart';
import 'package:upper/Screens/onboarding3.dart';
import 'package:upper/Screens/signup.dart';
import 'package:upper/Screens/verification.dart';
import 'package:upper/Screens/profile.dart';
import 'package:upper/Screens/index.dart';
import 'package:upper/Screens/products.dart';
import 'package:upper/Screens/destacados.dart';
import 'package:upper/Screens/vestimenta.dart';
import 'package:upper/Screens/prueba.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Index.id,
      routes: {
        Login.id: (context) => Login(),
        Signup.id: (context) => Signup(),
        Verification.id: (context) => Verification(),
        Profile.id: (context) => Profile(),
        Index.id: (context) => Index(),
        Categories.id: (context) => Categories(),
        Products.id: (context) => Products(),
        Destacados.id: (context) => Destacados(),
        Onboarding1.id: (context) => Onboarding1(),
        Onboarding2.id: (context) => Onboarding2(),
        Onboarding3.id: (context) => Onboarding3(),
        LoadingScreen.id: (context) => LoadingScreen(),
        Vestimenta.id: (contest) => Vestimenta(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:upper/Screens/categories.dart';
import 'package:upper/Screens/login.dart';
import 'package:upper/Screens/signup.dart';
import 'package:upper/Screens/verification.dart';
import 'package:upper/Screens/profile.dart';
import 'package:upper/Screens/index.dart';
import 'package:upper/Screens/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Products.id,
      routes: {
        Login.id: (context) => Login(),
        Signup.id: (context) => Signup(),
        Verification.id: (context) => Verification(),
        Profile.id: (context) => Profile(),
        Index.id: (context) => Index(),
        Categories.id: (context) => Categories(),
        Products.id: (context) => Products(),
      },
    );
  }
}

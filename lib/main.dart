import 'package:flutter/material.dart';
import 'package:upper/Screens/login.dart';
import 'package:upper/Screens/signup.dart';
import 'package:upper/Screens/verification.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'Login',
      routes: {
        'Login': (context) => Login(),
        'Signup': (context) => Signup(),
        'Verification': (context) => Verification(),
      },
    );
  }
}

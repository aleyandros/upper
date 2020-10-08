import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:upper/Networking/firebase.dart';
import 'package:upper/Screens/index.dart';
import 'package:upper/Screens/login.dart';
import 'index.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  static final id = "loading";
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  void getUserData() async {
    var user = await getCurrentUser();
    if (user != null) {
      // esto se puede quitar cuando se llame al index de la pagina
      var userSnapshot = await getUserDocument(user);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return Index(
            userDocumentSnapshot: userSnapshot,
            user: user,
          );
        }),
      );
    } else {
      Navigator.pushReplacementNamed(context, Login.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}

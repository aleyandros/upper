import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:upper/Networking/firebase.dart';
import 'package:upper/Screens/login.dart';
import 'package:upper/Screens/profile.dart';
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
    var userData = await getCurrentUser();
    if (userData != null) {
      Navigator.pushNamed(context, Profile.id, arguments: <String, Object>{
        'userData': userData,
      });
    } else {
      Navigator.pushNamed(context, Login.id);
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:upper/Screens/signup.dart';
import '../Constants/labels.dart';

class Onboarding1 extends StatefulWidget {
  static final id = "onboarding1";
  @override
  _Onboarding1State createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: kWhiteColour,
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 8,
              child: SizedBox(),
            ),
            Expanded(
              flex: 7,
              child: Image(
                image: AssetImage("images/onb1.jpg"),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Text("Crea tu perfil",
                style: kLabelTitleBlack,),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text("En Upper podrás crear un perfil con tu correo electrónico y personalizarlo a tu gusto.",
                style: kLabelBlack,
                textAlign: TextAlign.center,),
              ),
            ),
            Expanded(
              flex: 2 ,
              child: Container(
                width: 280,
                child: RaisedButton(
                  color: kYellowColour,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      new BorderRadius.circular(15.0)),
                  onPressed: () {},
                  child: Text(
                    'SIGUIENTE',
                    style: kLabelButtonWhite,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    CupertinoIcons.circle_filled,
                    color: kBlueColour,
                  ),
                  Opacity(
                    child: Icon(
                      CupertinoIcons.circle_filled,
                      color: kBlueColour,
                    ),
                    opacity: 0.5,
                  ),
                  Opacity(
                    child: Icon(
                      CupertinoIcons.circle_filled,
                      color: kBlueColour,
                    ),
                    opacity: 0.5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

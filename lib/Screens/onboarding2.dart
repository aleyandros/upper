import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:upper/Screens/signup.dart';
import '../Constants/labels.dart';
import '../Constants/buttons.dart';

class Onboarding2 extends StatefulWidget {
  static final id = "onboarding2";
  @override
  _Onboarding2State createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {
  Buttons but = Buttons();
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
                image: AssetImage("images/onb2.jpg"),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Text("Pide lo que quieras",
                  style: kLabelTitleBlack,),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text("Contamos con una gran variedad de tiendas asociadas, encontrarás desde ropa, tecnología hasta comida.",
                  style: kLabelBlack,
                  textAlign: TextAlign.center,),
              ),
            ),
            Expanded(
              flex: 2,
              child: but.biggestButton(
                  text: 'SIGUIENTE',
                  width: 280.0,
                  height: 30.0,
                  onPress: (){}
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Opacity(
                    child: Icon(
                      CupertinoIcons.circle_filled,
                      color: kBlueColour,
                    ),
                    opacity: 0.5,
                  ),
                  Icon(
                    CupertinoIcons.circle_filled,
                    color: kBlueColour,
                  ),
                  Opacity(
                    opacity: 0.5,
                    child: Icon(
                      CupertinoIcons.circle_filled,
                      color: kBlueColour,
                    ),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:upper/Screens/signup.dart';
import '../Constants/labels.dart';

class Onboarding3 extends StatefulWidget {
  static final id = "onboarding3";
  @override
  _Onboarding3State createState() => _Onboarding3State();
}

class _Onboarding3State extends State<Onboarding3> {
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
                image: AssetImage("images/onb3.jpg"),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Text("Recíbelo en poco tiempo",
                  style: kLabelTitleBlack,),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text("Obtendrás tu producto el mismo día y tu alimento en menos de una hora.",
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
                  Icon(
                    CupertinoIcons.circle_filled,
                    color: kBlueColour,
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

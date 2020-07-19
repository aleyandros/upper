import 'package:flutter/material.dart';
import '../Constants/labels.dart';

class Signup extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: kBlueColour,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10.0,
                            ),
                            Icon(
                              Icons.arrow_back_ios,
                              color: kWhiteColour,
                              size: 16.0,
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Registrate',
                                  style: kLabelTitleWhite,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Container(
                          color: kWhiteColour,
                          width: 374,
                          height: 571,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 670.0,
              child: Container(
                color: kYellowColour,
                width: 300.0,
                height: 50.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

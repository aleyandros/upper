import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Constants/labels.dart';

class Verification extends StatefulWidget {
  static final id = "verification";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Verification> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Expanded(
            child: Container(
              color: kBlueColour,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 138,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 20.0,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: kWhiteColour,
                            size: 16.0,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Verificación',
                              style: kLabelTitleWhite,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30.0,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 20,
                    child: Container(
                      color: kBlueColour,
                    ),
                  ),
                  Expanded(
                    flex: 100,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Hemos enviado un código de confirmación "
                        "\na tu correo electrónico, ingresalo aquí.",
                        style: kLabelSubtitleWhite,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 600,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          //padding: EdgeInsets.symmetric(
                          //  horizontal: 30, vertical: 10),
                          color: kWhiteColour,
                          width: 372,
                          height: 300,
                          child: Center(
                            child: Text(
                              "_ _ _ _",
                              style: kLabelVerificationGrey,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 314,
                          height: 50,
                          child: RaisedButton(
                            color: kYellowColour,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(15.0)),
                            onPressed: () {
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              if (_formKey.currentState.validate()) {
                                // Process data.
                              }
                            },
                            child: Text(
                              'FINALIZAR',
                              style: kLabelButtonWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upper/Constants/buttons.dart';
import 'package:upper/Screens/signup.dart';
import 'package:upper/Screens/profile.dart';
import '../Constants/labels.dart';
import 'package:upper/Networking/firebase.dart';
import '../Constants/inputs.dart';

class Verification extends StatefulWidget {
  static final id = "verification";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Verification> {
  final _formKey = GlobalKey<FormState>();
  Inputs inp = Inputs();
  Buttons but = Buttons();
  String _codigo;
  String _backendError = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: kBlueColour,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: kUpGrid,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 20.0,
                      ),
                      but.backButton(
                        icon: Icons.arrow_back_ios,
                        color: kWhiteColour,
                        navigation: () {
                          Navigator.pushNamed(context, Signup.id);
                        },
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
                      but.backButton(
                        icon: Icons.shop,
                        color: kBlueColour,
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: kBlueColour,
                  ),
                ),
                Expanded(
                  flex: kCenterUpGrid + 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: kCenterBottomGrid - 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Hemos enviado un código de confirmación "
                        "\na tu núemero de telefono, ingresalo aquí.",
                        style: kLabelSubtitleWhite,
                        textAlign: TextAlign.center,
                      ),
                      Card(
                        elevation: 3,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                          color: kWhiteColour,
                          width: 374,
                          height: 300,
                          child: Form(
                            key: _formKey,
                            autovalidate: false,
                            onChanged: () {
                              Form.of(primaryFocus.context).save();
                            },
                            child: Container(
                              child: inp.inputForm(
                                description: '',
                              ),
                            ),
                          ),
                        ),
                      ),
                      but.biggestButton(
                          text: 'finalizar',
                          onPress: () {
                            Navigator.pushNamed(context, Profile.id);
                          }),
                    ],
                  ),
                ),
                Expanded(
                  flex: kBottomGrid,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

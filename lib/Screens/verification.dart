import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upper/Constants/buttons.dart';
import 'package:upper/Screens/signup.dart';

import 'package:upper/Screens/index.dart';
import 'package:upper/Screens/profile.dart';
import '../Constants/labels.dart';
import 'package:upper/Networking/firebase.dart';
import '../Constants/inputs.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:pinput/pin_put/pin_put_state.dart';

class Verification extends StatefulWidget {
  static final id = "verification";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Verification> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: kBlueColour),
      borderRadius: BorderRadius.circular(15),
    );
  }

  Inputs inp = Inputs();
  Buttons but = Buttons();
  String _codigo;
  String _backendError = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: kBlueColour,
          leading: but.backButton(
            icon: Icons.arrow_back_ios,
            color: kWhiteColour,
            navigation: () {
              Navigator.pushNamed(context, Signup.id);
            },
          ),
          title: Center(
            child: Text(
              'Verificación',
              style: kLabelTitleWhite,
            ),
          ),
          actions: <Widget>[
            but.backButton(
              icon: Icons.store,
              color: kBlueColour,
              navigation: () {
                Navigator.pushNamed(context, Index.id);
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            color: kBlueColour,
            child: Column(
              children: <Widget>[
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
                      SizedBox(
                        height: 50,
                      ),
                      Expanded(
                        child: Card(
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
                                height: 40,
                                child: PinPut(
                                  fieldsCount: 4,
                                  // pin es el codigo ingresado y se devuelve cuando se ha ingresado los 4 numeros.
                                  onSubmit: (String pin) {
                                    setState(() {
                                      _codigo = pin;
                                    });
                                  },
                                  focusNode: _pinPutFocusNode,
                                  controller: _pinPutController,
                                  submittedFieldDecoration:
                                      _pinPutDecoration.copyWith(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                  selectedFieldDecoration: _pinPutDecoration,
                                  followingFieldDecoration:
                                      _pinPutDecoration.copyWith(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: kYellowColour.withOpacity(.5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      but.biggestButton(text: "Finalizar", onPress: () {}),
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

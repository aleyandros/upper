import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:upper/Networking/authExceptionHandler.dart';
import 'package:upper/Networking/firebase.dart';
import 'package:upper/Screens/signup.dart';
import '../Constants/labels.dart';
import 'profile.dart';

class Login extends StatefulWidget {
  static final id = "login";
  @override
  _LoginState createState() => _LoginState();
}

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class _LoginState extends State<Login> {
  String _userId = "";
  String _email;
  String _pass;
  String _backendError = "";
  final _formKey = GlobalKey<FormState>();

  void initState() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: kBlueColour,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: kWhiteColour,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Bienvenido a Upper',
                    style: kLabelTitleWhite,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Inicia sesión o crea una\ncuenta.',
                    textAlign: TextAlign.center,
                    style: kLabelSubtitleWhite,
                  ),
                ),
                Visibility(
                  visible: _backendError.isNotEmpty,
                  child: Text(
                    _backendError,
                    style: kLabelWhite,
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Form(
                    key: _formKey,
                    autovalidate: false,
                    child: Card(
                      elevation: 3,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        overflow: Overflow.visible,
                        children: <Widget>[
                          Container(
                            color: Colors.white,
                            width: 374.0,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ListView(
                                children: <Widget>[
                                  Container(
                                    child: Expanded(
                                      flex: 1,
                                      child: SizedBox(),
                                    ),
                                  ),
                                  Container(
                                    child: Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Correo Electronico:',
                                              style: kLabelSignupBlue,
                                            ),
                                          ),
                                          TextFormField(
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              decoration: const InputDecoration(
                                                suffixIcon: Icon(
                                                  Icons.mail,
                                                ),
                                                hintText:
                                                    'diego35.da@gmail.com',
                                              ),
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'ex: upper@mail.co';
                                                }
                                                return null;
                                              },
                                              onSaved: (string) {
                                                _email = string;
                                              }),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Contraseña:',
                                              style: kLabelSignupBlue,
                                            ),
                                          ),
                                          TextFormField(
                                              obscureText: true,
                                              decoration: const InputDecoration(
                                                suffixIcon: Icon(
                                                  Icons.lock,
                                                ),
                                                hintText: '**********',
                                              ),
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return '******';
                                                }
                                                return null;
                                              },
                                              onSaved: (string) {
                                                _pass = string;
                                              }),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        height: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -25,
                            child: SizedBox(
                              width: 314,
                              height: 50,
                              child: RaisedButton(
                                color: kYellowColour,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(15.0)),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();

                                    String feedback = await signIn(
                                      email: _email,
                                      pass: _pass,
                                    );

                                    FirebaseUser user = await getCurrentUser();
                                    // only because of the edit profile, remove when index is added
                                    var userSnapshot =
                                        await getUserDocument(user);
                                    setState(() {
                                      _backendError = feedback;
                                      if (user != null) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return Profile(
                                              userDocumentSnapshot:
                                                  userSnapshot,
                                              user: user,
                                            );
                                          }),
                                        );
                                      }
                                    });
                                  }
                                },
                                child: Text(
                                  'INICIAR SESIÓN',
                                  style: kLabelButtonWhite,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: SizedBox(
                    height: 30,
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '¿No tienes cuenta? ',
                            style: kLabelBlue,
                          ),
                          FlatButton(
                            child: Text(
                              "crea una",
                              style: kLabelUnderlineBlue,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, Signup.id);
                            },
                          )
                        ],
                      ),
                      Expanded(
                        flex:2,
                        child: SizedBox(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

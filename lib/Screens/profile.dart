import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upper/Constants/buttons.dart';
import 'package:upper/Screens/login.dart';
import '../Constants/labels.dart';
import 'package:upper/Networking/firebase.dart';
import '../Constants/inputs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatefulWidget {
  static final id = "profile";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();
  Inputs inp = Inputs();
  Buttons but = Buttons();
  String _nombre;
  String _apellido;
  String _pass1;
  String _pass2;
  String _celular;
  String _email;
  String _backendError = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: kWhiteColour,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 50,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 20.0,
                      ),
                      but.backButton(
                          icon: Icons.arrow_back_ios, color: kGreyColour),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Registrate',
                            style: kLabelTitleWhite,
                          ),
                        ),
                      ),
                      but.backButton(
                          icon: FontAwesomeIcons.shoppingCart,
                          color: kBlueColour),
                      SizedBox(
                        width: 30.0,
                      ),
                    ],
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
                  flex: 100,
                  child: Container(
                    color: kRedColour,
                  ),
                ),
                Expanded(
                  flex: 600,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: <Widget>[
                      Card(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                          color: kWhiteColour,
                          width: 374,
                          child: Form(
                            key: _formKey,
                            autovalidate: false,
                            onChanged: () {
                              Form.of(primaryFocus.context).save();
                            },
                            child: ListView(
                              /*mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,*/
                              children: <Widget>[
                                inp.dividerElements(),
                                inp.textForm("Nombre"),
                                inp.inputForm(
                                    description: "Tu nombre",
                                    correction: "Escribe tu nombre",
                                    validate: (String value) {
                                      if (value.isEmpty) {
                                        return "Escribe tu nombre";
                                      }
                                      return null;
                                    },
                                    onSave: (value) {
                                      _nombre = value;
                                    }),
                                inp.dividerElements(),
                                inp.textForm("Apellido"),
                                inp.inputForm(
                                    description: "Tu apellido",
                                    correction: "Escribe tu apellido",
                                    validate: (String value) {
                                      if (value.isEmpty) {
                                        return "Escribe tu apellido";
                                      }
                                      return null;
                                    },
                                    onSave: (value) {
                                      _apellido = value;
                                    }),
                                inp.dividerElements(),
                                inp.textForm("Correo electrónico"),
                                inp.inputForm(
                                    keyboard: TextInputType.emailAddress,
                                    description: "Correo electrónico",
                                    correction: "ex: upper@mail.co",
                                    validate: (String value) {
                                      if (value.isEmpty) {
                                        return "Escribe tu correo";
                                      }
                                      return null;
                                    },
                                    onSave: (value) {
                                      _email = value;
                                    }),
                                inp.dividerElements(),
                                inp.textForm("Celular"),
                                inp.inputForm(
                                    keyboard: TextInputType.numberWithOptions(),
                                    description: "(000)-000-00-00",
                                    correction: "No valido",
                                    validate: (String value) {
                                      if (value.isEmpty) {
                                        return "Ingresa unnumero de celular";
                                      }
                                      return null;
                                    },
                                    onSave: (value) {
                                      _celular = value;
                                    }),
                                inp.dividerElements(),
                                inp.textForm("Contraseña"),
                                inp.inputForm(
                                    obscureText: true,
                                    description: "********",
                                    correction: "No valido",
                                    icon: Icons.lock,
                                    validate: (String value) {
                                      if (value.length < 6) {
                                        return "No valido";
                                      } else {
                                        _pass1 = value;
                                      }
                                      return null;
                                    }),
                                inp.dividerElements(),
                                inp.textForm("Repetir contraseña"),
                                inp.inputForm(
                                    obscureText: true,
                                    description: "********",
                                    correction: "No son iguales",
                                    icon: Icons.lock,
                                    validate: (value) {
                                      if (value == _pass1) {
                                        _pass2 = value;
                                        return null;
                                      } else {
                                        return "La contraseña no coincide";
                                      }
                                    })
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -25,
                        child: but.biggestButton(
                          text: 'crear cuenta',
                          width: 314.0,
                          height: 50.0,
                          onPress: () async {
                            // Validate will return true if the form is valid, or false if
                            // the form is invalid.
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();

                              String feedback = await register(
                                  nombre: _nombre,
                                  apellido: _apellido,
                                  email: _email,
                                  pass: _pass2,
                                  phone: _celular);
                              verifyPhone(_celular);
                              setState(() {
                                _backendError = feedback;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                    overflow: Overflow.visible,
                  ),
                ),
                Expanded(
                  flex: 55,
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

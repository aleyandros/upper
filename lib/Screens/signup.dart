import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upper/Constants/buttons.dart';
import '../Constants/labels.dart';
import 'package:upper/Networking/firebase.dart';
import '../Constants/inputs.dart';

class Signup extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  Inputs inp = Inputs();
  Buttons but = Buttons();
  String nombre;
  String apellido;
  String pass;
  String celular;
  String email;
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
                        but.backButton(icon: Icons.arrow_back_ios),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Registrate',
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
                              autovalidate: true,
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
                                      validate: (value) {
                                        if (value == null) {
                                          return "Escribe tu nombre";
                                        }
                                        return null;
                                      },
                                      onSave: (value) {
                                        nombre = value;
                                      }),
                                  inp.dividerElements(),
                                  inp.textForm("Apellido"),
                                  inp.inputForm(
                                      description: "Tu apellido",
                                      correction: "Escribe tu apellido",
                                      validate: (value) {
                                        if (value == null) {
                                          return "Escribe tu apellido";
                                        }
                                        return null;
                                      },
                                      onSave: (value) {
                                        apellido = value;
                                      }),
                                  inp.dividerElements(),
                                  inp.textForm("Correo electrónico"),
                                  inp.inputForm(
                                      keyboard: TextInputType.emailAddress,
                                      description: "Correo electrónico",
                                      correction: "ex: upper@mail.co",
                                      validate: (value) {
                                        if (value == null) {
                                          return "Escribe tu correo";
                                        }
                                        return null;
                                      },
                                      onSave: (value) {
                                        email = value;
                                      }),
                                  inp.dividerElements(),
                                  inp.textForm("Celular"),
                                  inp.inputForm(
                                      keyboard:
                                          TextInputType.numberWithOptions(),
                                      description: "(000)-000-00-00",
                                      correction: "No valido",
                                      validate: (value) {
                                        if (value == null) {
                                          return "celular";
                                        }
                                        return null;
                                      },
                                      onSave: (value) {
                                        celular = value;
                                      }),
                                  inp.dividerElements(),
                                  inp.textForm("Contraseña"),
                                  inp.inputForm(
                                      description: "********",
                                      correction: "No valido",
                                      icon: Icons.lock,
                                      validate: (String value) {
                                        if (value.length > 6) {
                                          return "No valido";
                                        }
                                        return null;
                                      }),
                                  inp.dividerElements(),
                                  inp.textForm("Repetir contraseña"),
                                  inp.inputForm(
                                      description: "********",
                                      correction: "No son iguales",
                                      icon: Icons.lock,
                                      validate: (String value) {
                                        if (value.length > 6) {
                                          return "No valido";
                                        }
                                        return null;
                                      })
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -25,
                          child: GestureDetector(
                            child: but.biggestButton(
                                text: 'crear cuenta',
                                width: 314.0,
                                height: 50.0),
                            onTap: () async {
                              if (_formKey.currentState.validate()) {
                                await register(
                                    nombre: "Register",
                                    apellido: "upper",
                                    email: "register2@upper.com",
                                    pass: "123456",
                                    phone: "+573152523657");
                              }
                            },
                          ),
                          /*child: SizedBox(
                            width: 314,
                            height: 50,
                            child: RaisedButton(
                              color: kYellowColour,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(15.0)),
                              onPressed: () async {
                                // Validate will return true if the form is valid, or false if
                                // the form is invalid.
                                if (_formKey.currentState.validate()) {
                                  await register(
                                      nombre: "Register",
                                      apellido: "upper",
                                      email: "register@upper.com",
                                      pass: "123456",
                                      phone: "+573152523657");
                                }
                              },
                              child: Text(
                                'CREAR CUENTA',
                                style: kLabelButtonWhite,
                              ),
                            ),
                          ),*/
                        ),
                      ],
                      overflow: Overflow.visible,
                    ),
                  ),
                  Expanded(
                    flex: 135,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '¿Ya tienes cuenta? ',
                          style: kLabelWhite,
                        ),
                        Text(
                          'inicia sesión',
                          style: kLabelUnderlineWhite,
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

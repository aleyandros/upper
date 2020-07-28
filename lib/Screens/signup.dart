import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upper/Constants/buttons.dart';
import '../Constants/labels.dart';
import 'package:upper/Networking/firebase.dart';
import '../Constants/inputs.dart';

class Signup extends StatefulWidget {
  static final id = "signup";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  Inputs inp = Inputs();
  Buttons but = Buttons();
  String nombre;
  String apellido;
  String pass1;
  String pass2;
  String celular;
  String email;
  String backendError = "";
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
                Visibility(
                  visible: backendError.isNotEmpty,
                  child: Text(
                    backendError,
                    style: kLabelWhite,
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
                                      nombre = value;
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
                                      apellido = value;
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
                                      email = value;
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
                                      celular = value;
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
                                        pass1 = value;
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
                                      if (value == pass1) {
                                        pass2 = value;
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
                                  nombre: nombre,
                                  apellido: apellido,
                                  email: email,
                                  pass: pass2,
                                  phone: celular);
                              verifyPhone(celular);
                              setState(() {
                                backendError = feedback;
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
                  flex: 135,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '¿Ya tienes cuenta? ',
                        style: kLabelWhite,
                      ),
                      FlatButton(
                        child: Text(
                          'inicia sesión',
                          style: kLabelUnderlineWhite,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'Login');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

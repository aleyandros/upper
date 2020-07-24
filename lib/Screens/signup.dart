import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Constants/labels.dart';
import 'package:upper/Networking/firebase.dart';
class Signup extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Signup> {
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
                        Icon(
                          Icons.arrow_back_ios,
                          color: kWhiteColour,
                          size: 16.0,
                        ),
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
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          color: kWhiteColour,
                          width: 374,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  'Nombre:',
                                  style: kLabelSignupBlue,
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Tu nombre',
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Escribe tu nombre';
                                    }
                                    return null;
                                  },
                                ),
                                Text(
                                  'Apellido:',
                                  style: kLabelSignupBlue,
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Tu apellido',
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Escribe tu apellido';
                                    }
                                    return null;
                                  },
                                ),
                                Text(
                                  'Correo Electronico:',
                                  style: kLabelSignupBlue,
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Correo Electrónico',
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'ex: upper@mail.co';
                                    }
                                    return null;
                                  },
                                ),
                                Text(
                                  'Celular',
                                  style: kLabelSignupBlue,
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: '*** *** ****',
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return '******';
                                    }
                                    return null;
                                  },
                                ),
                                Text(
                                  'Contraseña:',
                                  style: kLabelSignupBlue,
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Contraseña',
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return '******';
                                    }
                                    return null;
                                  },
                                ),
                                Text(
                                  'Repetir contraseña:',
                                  style: kLabelSignupBlue,
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Repite la contraseña',
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return '******';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  width: 30.0,
                                )
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
                              onPressed: () async{
                                // Validate will return true if the form is valid, or false if
                                // the form is invalid.
                                if (_formKey.currentState.validate()) {
                                  await register(nombre:"Register" , apellido: "upper", email: "register@upper.com", pass: "123456", phone: "+573152523657");
                                }
                              },
                              child: Text(
                                'CREAR CUENTA',
                                style: kLabelButtonWhite,
                              ),
                            ),
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

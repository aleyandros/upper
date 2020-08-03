import 'package:flutter/material.dart';
import 'package:upper/Screens/signup.dart';
import '../Constants/labels.dart';

class Login extends StatefulWidget {
  static final id = "login";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  flex: 6,
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
                  flex: 2,
                  child: Text(
                    'Inicia sesión o crea una\ncuenta.',
                    textAlign: TextAlign.center,
                    style: kLabelSubtitleWhite,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 8,
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
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                                Expanded(
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
                                        decoration: const InputDecoration(
                                          suffixIcon: Icon(
                                            Icons.mail,
                                          ),
                                          hintText: 'diego35.da@gmail.com',
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'ex: upper@mail.co';
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
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
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(),
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
                              onPressed: () {},
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
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
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
                ),
                Expanded(
                  flex: 5,
                  child: SizedBox(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

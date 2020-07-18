import 'package:flutter/material.dart';


class Login extends StatefulWidget {
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
                    color: Color(0xFF2BB2FF),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Bienvenido a Upper',
                          style: TextStyle(
                              fontFamily: 'Montserrat-SemiBold',
                              color: Colors.white,
                              fontSize: 25.0),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Inicia sesion o crea una\ncuenta.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Montserrat-Regular',
                              color: Colors.white,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Color(0xFFFFFFFF),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '¿No tienes cuenta? ',
                          style: TextStyle(
                            fontFamily: 'Montserrat-Regular',
                            fontSize: 14.0,
                            color: Color(0xFF2BB2FF),
                          ),
                        ),
                        Text(
                          'crea una',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontFamily: 'Montserrat-Medium',
                            fontSize: 14.0,
                            color: Color(0xFF2BB2FF),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 395.0,
              child: Container(
                color: Colors.white,
                width: 374.0,
                height: 200.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

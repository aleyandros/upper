import 'package:flutter/material.dart';
import '../Constants/labels.dart';

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
                    color: kBlueColour,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Bienvenido a Upper',
                          style: kLabelTitleWhite,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Inicia sesion o crea una\ncuenta.',
                          textAlign: TextAlign.center,
                          style: kLabelSubtitleWhite,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: kWhiteColour,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '¿No tienes cuenta? ',
                          style: kLabelBlue,
                        ),
                        Text(
                          'crea una',
                          style: kLabelUnderlineBlue,
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
                color: kWhiteColour,
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upper/Constants/buttons.dart';
import 'package:upper/Constants/panels.dart';
import 'package:upper/Screens/verification.dart';
import '../Constants/labels.dart';
import 'package:upper/Networking/firebase.dart';
import '../Constants/inputs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Destacados extends StatefulWidget {
  static final id = "destacados";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Destacados> {
  final _formKey = GlobalKey<FormState>();
  Inputs inp = Inputs();
  Buttons but = Buttons();
  Panels pan = Panels();
  String _backendError = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: kWhiteColour,
        body: SafeArea(
          child: Container(
            color: kWhiteColour,
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
                        color: kGreyColour,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '',
                            style: kLabelUpperYellow,
                          ),
                        ),
                      ),
                      but.backButton(
                          icon: FontAwesomeIcons.shoppingCart,
                          color: kBlueColour,
                          navigation: () {
                            Navigator.pushNamed(context, Verification.id);
                          }),
                      SizedBox(
                        width: 20.0,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: kCenterUpGrid + kCenterBottomGrid + kBottomGrid,
                  child: GridView.count(
                    primary: false,
                    padding: EdgeInsets.all(20),
                    crossAxisSpacing: 34,
                    mainAxisSpacing: 30,
                    crossAxisCount: 2,
                    childAspectRatio: (170 / 210),
                    children: <Widget>[
                      pan.ImageDestac(
                          image: 'hamburguesa.png',
                          description: 'Black burguer',
                          price: '\$15.000'),
                      pan.ImageDestac(
                          image: 'hamburguesa.png',
                          description: 'Black burguer',
                          price: '\$15.000'),
                      pan.ImageDestac(
                          image: 'hamburguesa.png',
                          description: 'Black burguer',
                          price: '\$15.000'),
                      pan.ImageDestac(
                          image: 'hamburguesa.png',
                          description: 'Black burguer',
                          price: '\$15.000'),
                      pan.ImageDestac(
                          image: 'hamburguesa.png',
                          description: 'Black burguer',
                          price: '\$15.000'),
                      pan.ImageDestac(
                          image: 'hamburguesa.png',
                          description: 'Black burguer',
                          price: '\$15.000'),
                      pan.ImageDestac(
                          image: 'hamburguesa.png',
                          description: 'Black burguer',
                          price: '\$15.000'),
                      pan.ImageDestac(
                          image: 'hamburguesa.png',
                          description: 'Black burguer',
                          price: '\$15.000'),
                      pan.ImageDestac(
                          image: 'hamburguesa.png',
                          description: 'Black burguer',
                          price: '\$15.000'),
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

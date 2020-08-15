import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upper/Constants/buttons.dart';
import 'package:upper/Screens/verification.dart';
import '../Constants/labels.dart';
import 'package:upper/Networking/firebase.dart';
import '../Constants/inputs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Constants/grid.dart';

class Index extends StatefulWidget {
  static final id = "index";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Index> {
  final _formKey = GlobalKey<FormState>();
  Inputs inp = Inputs();
  Buttons but = Buttons();
  Grid grid = Grid();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: kWhiteColour,
        appBar: AppBar(
          backgroundColor: kWhiteColour,
          leading: Builder(
            builder: (BuildContext context) {
              return but.backButton(
                icon: FontAwesomeIcons.bars,
                color: kGreyColour,
                navigation: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          actions: <Widget>[
            but.backButton(
              icon: FontAwesomeIcons.shoppingCart,
              color: kBlueColour,
            )
          ],
        ),
        drawer: Drawer(
          child: DrawerHeader(
            child: Center(
              child: Text(
                "Upper",
                style: kLabelUpperYellow,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            color: kWhiteColour,
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: inp.searchBar(text: 'Que desea?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

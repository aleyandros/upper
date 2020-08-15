import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upper/Constants/buttons.dart';
import 'package:upper/Constants/panels.dart';
import 'package:upper/Screens/profile.dart';
import '../Constants/labels.dart';
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
  Panels pan = Panels();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
          child: Container(
            color: kBlueColour,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 30),
              children: <Widget>[
                DrawerHeader(
                  child: Center(
                    child: Text(
                      "Upper",
                      style: kLabelUpperYellow,
                    ),
                  ),
                ),
                but.elementDrawer(
                  icon: FontAwesomeIcons.userAlt,
                  color: kWhiteColour,
                  text: "Mi perfil",
                  navigator: () {
                    Navigator.pushNamed(context, Profile.id);
                  },
                ),
                but.elementDrawer(
                  icon: FontAwesomeIcons.dolly,
                  color: kWhiteColour,
                  text: "Pedidos",
                  navigator: null,
                ),
                but.elementDrawer(
                  icon: FontAwesomeIcons.thumbtack,
                  color: kWhiteColour,
                  text: "Ubicación",
                  navigator: null,
                ),
                but.elementDrawer(
                  icon: FontAwesomeIcons.moneyBill,
                  color: kWhiteColour,
                  text: "Pagos",
                  navigator: null,
                ),
                but.elementDrawer(
                  icon: FontAwesomeIcons.question,
                  color: kWhiteColour,
                  text: "Ayuda",
                  navigator: null,
                ),
                but.elementDrawer(
                  icon: FontAwesomeIcons.signOutAlt,
                  color: kWhiteColour,
                  text: "Cerrar sesión",
                  navigator: null,
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            color: kWhiteColour,
            child: ListView(
              shrinkWrap: true,
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

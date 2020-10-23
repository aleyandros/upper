import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upper/Constants/buttons.dart';
import 'package:upper/Constants/panels.dart';
import 'package:upper/Screens/index.dart';
import 'package:upper/Screens/vestimenta.dart';
import '../Constants/labels.dart';
import 'package:upper/Networking/firebase.dart';
import '../Constants/inputs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Constants/grid.dart';
import 'package:upper/Constants/panels.dart';

class Categories extends StatefulWidget {
  static final id = "categories";
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Buttons but = Buttons();
  Inputs inp = Inputs();
  Panels pan = Panels();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: kWhiteColour,
        appBar: AppBar(
          backgroundColor: kWhiteColour,
          leading: but.smallButton(
            icon: Icons.arrow_back_ios,
            color: kGreyColour,
            navigation: () {
              Navigator.pushNamed(context, Index.id);
            },
          ),
          actions: <Widget>[
            but.smallButton(
              icon: FontAwesomeIcons.shoppingCart,
              color: kBlueColour,
              navigation: () {
                Navigator.pushNamed(context, Vestimenta.id);
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: GridView.count(
                    primary: false,
                    padding: EdgeInsets.all(20),
                    crossAxisSpacing: 34,
                    mainAxisSpacing: 30,
                    childAspectRatio: (170 / 100),
                    crossAxisCount: 1,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: inp.searchBar(text: 'Que desea?'),
                      ),

                      Container(
                        child: pan.tiendaCat(
                            image: "baila.png",
                            nombre: "Baila International Footwear",
                            estado: "Abierto"),
                      ),
                      Container(
                        child: pan.tiendaCat(
                            image: "baila.png",
                            nombre: "Baila International Footwear",
                            estado: "Abierto"),
                      ),
                      Container(
                        child: pan.tiendaCat(
                            image: "baila.png",
                            nombre: "Baila International Footwear",
                            estado: "Abierto"),
                      ),
                      Container(
                        child: pan.tiendaCat(
                            image: "baila.png",
                            nombre: "Baila International Footwear",
                            estado: "Abierto"),
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

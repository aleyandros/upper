import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:upper/Screens/signup.dart';
import '../Constants/labels.dart';
import 'package:upper/Screens/verification.dart';
import '../Constants/inputs.dart';
import 'package:upper/Constants/buttons.dart';
import 'package:upper/Constants/panels.dart';

class Vestimenta extends StatefulWidget {
  static final id = "vestimenta";
  @override
  _VestimentaState createState() => _VestimentaState();
}

class _VestimentaState extends State<Vestimenta> {
  Inputs inp = Inputs();
  Buttons but = Buttons();
  Panels pan = Panels();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: kWhiteColour,
        body: SafeArea(
          child: Container(
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
                  flex: kCenterUpGrid+4,
                  child: Column(
                    children: <Widget>[
                      Container(
                          child: inp.searchBar(text: "Buscar tiendas")),
                      SizedBox(
                        height: 30,
                        width: double.infinity,
                        child: Divider(
                          color: kBlackColour,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Vestimenta",
                          style: kLabelTitleBlack,),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: kCenterBottomGrid-4 + kBottomGrid,
                  child: GridView.count(
                    primary: false,
                    padding: EdgeInsets.all(20),
                    crossAxisSpacing: 34,
                    mainAxisSpacing: 30,
                    crossAxisCount: 1,

                    children: <Widget>[
                      Container(
                        child: pan.tiendaCat(image: "baila.png", nombre: "Baila International Footwear", estado: "Abierto"),
                      ),
                      Container(
                        child: pan.tiendaCat(image: "baila.png", nombre: "Baila International Footwear", estado: "Abierto"),
                      ),
                      Container(
                        child: pan.tiendaCat(image: "baila.png", nombre: "Baila International Footwear", estado: "Abierto"),
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

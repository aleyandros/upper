import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upper/Constants/buttons.dart';
import 'package:upper/Constants/panels.dart';
import 'package:upper/Screens/destacados.dart';
import '../Constants/labels.dart';
import 'package:upper/Networking/firebase.dart';
import '../Constants/inputs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class Products extends StatefulWidget {
  static final id = "products";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Products> {
  final _formKey = GlobalKey<FormState>();
  Inputs inp = Inputs();
  Buttons but = Buttons();
  Panels pan = Panels();
  String _backendError = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: kWhiteColour,
          leading: but.backButton(
            icon: Icons.arrow_back_ios,
            color: kGreyColour,
            navigation: () {
              Navigator.pushNamed(context, Destacados.id);
            },
          ),
          actions: <Widget>[
            but.backButton(
              icon: FontAwesomeIcons.shoppingCart,
              color: kBlueColour,
              navigation: () {},
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            color: kWhiteColour,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      pan.Images(image1: 'hamburguesa.png'),
                      inp.dividerElements3(),
                      pan.Texts(text: 'Black burger', style: kLabelTitleBlack),
                      inp.dividerElements4(),
                      pan.Texts(
                          text:
                              'Pan artesanal, carne de res 150 gr, queso cheddar, '
                              'plátano maduro, chorizo santarrosano, aros de '
                              'cebolla apanados con pan de arroz y vegetales frescos.',
                          style: kLabelBlack),
                      inp.dividerElements3(),
                      pan.Texts(
                          text: 'Personaliza tu pedido',
                          style: kLabelTitleBlack),
                      inp.dividerElements4(),
                      pan.Texts(
                          text: 'Selecciona hasta 6 opciones',
                          style: kLabelBlack),
                      inp.dividerElements2(),
                      pan.Ingredients(
                        text: 'Sin chorizo santarrosano',
                        image: 'Chorizo.png',
                        action: (bool value) {
                          setState(() {
                            timeDilation = value ? 2.0 : 1.0;
                          });
                        },
                      ),
                      pan.DividerIngredients(),
                      pan.Count(),
                      inp.dividerElements2()
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

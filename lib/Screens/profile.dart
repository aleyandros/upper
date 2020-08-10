import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upper/Constants/buttons.dart';
import 'package:upper/Screens/verification.dart';
import 'package:upper/Screens/index.dart';
import '../Constants/labels.dart';
import 'package:upper/Networking/firebase.dart';
import '../Constants/inputs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatefulWidget {
  static final id = "profile";
  Profile({this.user});
  final user;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();
  Inputs inp = Inputs();
  Buttons but = Buttons();
  String _nombre;
  String _apellido;
  String _pass1;
  String _celular;
  String _email;
  String _backendError = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.user);
  }

  void updateUI(FirebaseUser user) {
    setState(() {
      _email = user.email;
    });
  }

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
                          navigation: () {
                            Navigator.pushNamed(context, Index.id);
                          }),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "",
                            style: kLabelTitleWhite,
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
                  flex: kCenterUpGrid + kCenterBottomGrid,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: <Widget>[
                      Card(
                        elevation: 3,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                          color: kWhiteColour,
                          width: 374,
                          child: Form(
                            key: _formKey,
                            autovalidate: false,
                            onChanged: () {
                              Form.of(primaryFocus.context).save();
                            },
                            child: ListView(
                              /*mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,*/
                              children: <Widget>[
                                inp.dividerElements2(),
                                Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 50,
                                      backgroundColor: kBlueColour,
                                      child: CircleAvatar(
                                        radius: 49,
                                        backgroundImage: AssetImage(
                                            'images/PatinoChaparro_Foto.jpg'),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: -15,
                                      right: 90,
                                      child: but.bigIconsButton(
                                          icon: Icons.edit, color: kBlueColour),
                                    )
                                  ],
                                  overflow: Overflow.visible,
                                ),
                                inp.dividerElements(),
                                inp.textNameForm(_email),
                                inp.dividerElements2(),
                                inp.textForm("Nombre"),
                                inp.inputForm(
                                    description: "Tu nombre",
                                    correction: "Escribe tu nombre",
                                    validate: (String value) {
                                      if (value.isEmpty) {
                                        return "Escribe tu nombre";
                                      }
                                      return null;
                                    },
                                    onSave: (value) {
                                      _nombre = value;
                                    }),
                                inp.dividerElements2(),
                                inp.textForm("Apellido"),
                                inp.inputForm(
                                    description: "Tu apellido",
                                    correction: "Escribe tu apellido",
                                    validate: (String value) {
                                      if (value.isEmpty) {
                                        return "Escribe tu apellido";
                                      }
                                      return null;
                                    },
                                    onSave: (value) {
                                      _apellido = value;
                                    }),
                                inp.dividerElements2(),
                                inp.textForm("Correo electrónico"),
                                inp.inputForm(
                                    keyboard: TextInputType.emailAddress,
                                    description: "Correo electrónico",
                                    correction: "ex: upper@mail.co",
                                    validate: (String value) {
                                      if (value.isEmpty) {
                                        return "Escribe tu correo";
                                      }
                                      return null;
                                    },
                                    onSave: (value) {
                                      _email = value;
                                    }),
                                inp.dividerElements2(),
                                inp.textForm("Celular"),
                                inp.inputForm(
                                    keyboard: TextInputType.numberWithOptions(),
                                    description: "(000)-000-00-00",
                                    correction: "No valido",
                                    validate: (String value) {
                                      if (value.isEmpty) {
                                        return "Ingresa unnumero de celular";
                                      }
                                      return null;
                                    },
                                    onSave: (value) {
                                      _celular = value;
                                    }),
                                inp.dividerElements2(),
                                inp.textForm("Contraseña"),
                                inp.inputForm(
                                    obscureText: true,
                                    description: "********",
                                    correction: "No valido",
                                    icon: Icons.lock,
                                    validate: (String value) {
                                      if (value.length < 6) {
                                        return "No valido";
                                      } else {
                                        _pass1 = value;
                                      }
                                      return null;
                                    }),
                                inp.dividerElements2(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -25,
                        child: but.biggestButton(
                          text: 'editar perfil',
                          width: 314.0,
                          height: 50.0,
                          onPress: () async {
                            // Validate will return true if the form is valid, or false if
                            // the form is invalid.
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();

                              String feedback = await updateProfile(
                                  nombre: _nombre,
                                  apellido: _apellido,
                                  email: _email,
                                  pass: _pass1,
                                  phone: _celular);
                              verifyPhone(_celular);
                              setState(() {
                                _backendError = feedback;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                    overflow: Overflow.visible,
                  ),
                ),
                Expanded(
                  flex: kBottomGrid,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

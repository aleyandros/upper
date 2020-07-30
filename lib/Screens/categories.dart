import 'package:flutter/material.dart';
import 'package:upper/Screens/signup.dart';
import '../Constants/labels.dart';

class Categories extends StatefulWidget {
  static final id = "categories";
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: kWhiteColour,
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(

              ),
            ),
          ],
        ),
      ),
    );
  }
}

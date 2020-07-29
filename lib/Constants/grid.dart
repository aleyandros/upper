import 'labels.dart';
import 'buttons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Buttons but = Buttons();

class Grid {
  Widget Up({icon1, color1, nav, text, icon2, color2, nav2}) {
    return Expanded(
      flex: 50,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20.0,
          ),
          but.backButton(icon: icon1, color: color1),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: kLabelTitleWhite,
              ),
            ),
          ),
          but.backButton(icon: icon2, color: color2),
          SizedBox(
            width: 30.0,
          ),
        ],
      ),
    );
  }
}

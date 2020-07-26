import 'package:flutter/material.dart';
import 'labels.dart';

class Buttons {
  double _width = 314;
  double _height = 50;

  Widget biggestButton({@required text, width, height, Function onPress}) {
    return SizedBox(
      width: _width,
      height: _height,
      child: RaisedButton(
        color: kYellowColour,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15.0)),
        onPressed: onPress,
        child: Text(
          '$text'.toUpperCase(),
          style: kLabelButtonWhite,
        ),
      ),
    );
  }

  Widget backButton({@required icon}) {
    return Icon(
      icon,
      color: kWhiteColour,
      size: 16.0,
    );
  }
}

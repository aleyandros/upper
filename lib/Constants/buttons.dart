import 'package:flutter/material.dart';
import 'labels.dart';

class Buttons {
  double _width = 314;
  double _height = 50;

  Widget biggestButton({@required text, width, height}) {
    return SizedBox(
      width: _width,
      height: _height,
      child: RaisedButton(
        color: kYellowColour,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15.0)),
        onPressed: () async {},
        child: Text(
          '$text'.toUpperCase(),
          style: kLabelButtonWhite,
        ),
      ),
    );
  }

  Widget backButton({@required icono}) {
    return Icon(
      icono,
      color: kWhiteColour,
      size: 16.0,
    );
  }
}

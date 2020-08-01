import 'package:flutter/material.dart';
import 'labels.dart';

class Buttons {
  double _width;
  double _height;

  Widget biggestButton({@required text, width, height, Function onPress}) {
    _width = width != null ? _width = width : _width = 314;
    _height = height != null ? _height = height : _height = 50;
    return SizedBox(
      width: _width,
      height: _height,
      child: RaisedButton(
        color: kYellowColour,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        onPressed: onPress,
        child: Text(
          '$text'.toUpperCase(),
          style: kLabelButtonWhite,
        ),
      ),
    );
  }

  Widget backButton({@required icon, color, navigation}) {
    return IconButton(
      icon: Icon(
        icon,
        color: color,
        size: 20.0,
      ),
      onPressed: navigation,
    );
  }

  Widget bigIconsButton({@required icon, color, navigation}) {
    return IconButton(
      icon: Icon(
        icon,
        color: color,
        size: 24.0,
      ),
      onPressed: navigation,
    );
  }
}

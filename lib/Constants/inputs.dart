import 'package:flutter/material.dart';
import 'labels.dart';

class Inputs {
  Widget textForm(text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        '$text:',
        style: kLabelSignupBlue,
      ),
    );
  }

  Widget inputForm(
      {@required description,
      correction,
      icon,
      Function validate,
      Function onSave,
      TextInputType keyboard}) {
    return TextFormField(
      keyboardType: keyboard,
      decoration: InputDecoration(
        hintText: "  $description",
        suffixIcon: Icon(
          icon,
          color: kDarkerBlueColour,
        ),
      ),
      validator: validate,
      onSaved: onSave,
    );
  }

  Widget dividerElements() {
    return SizedBox(
      height: 20,
    );
  }
}

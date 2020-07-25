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

  Widget inputForm({@required description, correction, icon}) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "  $description",
        suffixIcon: Icon(
          icon,
          color: kDarkerBlueColour,
        ),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return correction;
        }
        return null;
      },
    );
  }

  Widget dividerElements() {
    return SizedBox(
      height: 20,
    );
  }
}

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

  Widget textNameForm(text) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        '$text',
        style: kLabelTitleBlack,
      ),
    );
  }

  Widget inputForm(
      {@required description,
      correction,
      icon,
      Function validate,
      Function onSave,
      TextInputType keyboard,
      bool obscureText,
      String initialValue}) {
    return TextFormField(
      initialValue: initialValue,
      obscureText: obscureText ?? false,
      keyboardType: keyboard,
      decoration: InputDecoration(
        hintText: "$description",
        suffixIcon: Icon(
          icon,
          color: kDarkerBlueColour,
        ),
      ),
      validator: validate,
      onSaved: onSave,
    );
  }

  Widget dividerElements2() {
    return SizedBox(
      height: 20,
    );
  }

  Widget dividerElements() {
    return SizedBox(
      height: 10,
    );
  }

  Widget dividerElements3() {
    return SizedBox(
      height: 30,
    );
  }

  Widget dividerElements4() {
    return SizedBox(
      height: 5,
    );
  }

  Widget searchBar({@required text}) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                  border: Border.all(color: kGreyColour, width: 2),
                  borderRadius: BorderRadius.circular(20),
                  color: kWhiteColour,
                  boxShadow: [
                    BoxShadow(
                      color: kGreyColour,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 6.0,
                    ),
                  ]),
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  icon: Icon(
                    Icons.search,
                    color: kGreyColour,
                  ),
                  hintText: text,

                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}

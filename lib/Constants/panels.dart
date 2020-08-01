import 'package:flutter/material.dart';
import 'labels.dart';

class Panels {
  Widget Images({@required image1, image2, image3, image4, image5}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          width: 10,
        ),
        Container(
          padding: EdgeInsets.all(180),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: ExactAssetImage('images/$image1'),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: kGreyColour,
                offset: Offset(1.0, 5.0),
                blurRadius: 3.0,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Widget Texts({@required text, @required style}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        text,
        style: style,
      ),
    );
  }

  Widget DividerIngredients() {
    return Container(
      width: double.infinity,
      height: 1,
      color: kGreyColour,
    );
  }

  Widget Ingredients({@required text, image, action}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        children: <Widget>[
          Container(
            height: 30,
            width: 30,
            child: Image.asset('images/$image'),
          ),
          SizedBox(
            width: 25,
          ),
          Text(
            text,
            style: kLabelBlack,
          ),
        ],
      ),
    );
  }
}

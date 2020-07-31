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

  /*Widget Ingredients({@required text, image, option}) {
    return;
  }*/
}

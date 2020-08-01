import 'package:flutter/material.dart';
import 'package:upper/Screens/products.dart';
import 'labels.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:upper/Constants/buttons.dart';

class Panels {
  Buttons but = Buttons();
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
    return Column(
      children: <Widget>[
        DividerIngredients(),
        CheckboxListTile(
          title: Text(
            text,
            style: kLabelBlack,
          ),
          value: timeDilation != 1.0,
          onChanged: action,
          secondary: Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Image.asset('images/$image'),
          ),
        ),
      ],
    );
  }

  Widget Count() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: kWhiteColour,
                boxShadow: [
                  BoxShadow(
                    color: kGreyColour,
                    offset: Offset(-1.0, 1.0),
                    blurRadius: 1.0,
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  but.backButton(
                    icon: Icons.add,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    '1',
                    style: kLabelSubtitleBlack,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  but.backButton(
                    icon: Icons.remove,
                  ),
                ],
              ),
            ),
            but.biggestButton(
              text: 'Agregar   \$15.000',
              height: 40.0,
              width: 150.0,
              onPress: () {},
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:upper/Screens/products.dart';
import 'labels.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:upper/Constants/buttons.dart';

class Panels {
  Buttons but = Buttons();

  //Imagen grande
  //Utilizado en:
  //-Products
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

  //Subtitulo negro
  //Utilizado en:
  //-Destacados
  //-Products
  Widget Texts({@required text, @required style}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        text,
        style: style,
      ),
    );
  }

  //Linea divisora entre ingredientes
  //Utilizado en:
  //-Products
  Widget DividerIngredients() {
    return Container(
      width: double.infinity,
      height: 1,
      color: kGreyColour,
    );
  }

  //Icono, texto y checkbox del ingrediente
  //Utilizado en:
  //-Productos
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

  //Contador productos + boton agregar al carrito
  //Utilizado en:
  //-Products
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
                  but.smallButton(
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
                  but.smallButton(
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

  //Card tienda/categoria
  //Utilizado en:
  //-Caategories
  //-Vestimenta
  Widget tiendaCat({
    @required image,
    nombre,
    estado,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: kGreyColour,
            offset: Offset(-3.0, 1.0),
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.0),
                ),
                image: DecorationImage(
                  image: ExactAssetImage('images/$image'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(

            decoration: BoxDecoration(
              color: kWhiteColour,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 11.0, vertical: 10.0),
              child: Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      nombre,
                      style: kLabelSubtitleBlack,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      estado,
                      style: kLabelSubtitleBlack,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Card producto destacado
  //Utilizado en:
  //-Destacados
  Widget ImageDestac({
    @required image,
    description,
    price,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: kGreyColour,
            offset: Offset(-3.0, 1.0),
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.0),
                ),
                image: DecorationImage(
                  image: ExactAssetImage('images/$image'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: kWhiteColour,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 11.0, vertical: 10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('$price', style: kLabelSubtitleBlack),
                      SizedBox(
                        width: 30,
                        height: 20,
                        child: IconButton(
                          icon: Icon(Icons.favorite_border),
                          onPressed: () {},
                          color: kBlueColour,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      description,
                      style: kLabelSubtitleBlack,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

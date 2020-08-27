import 'package:flutter/material.dart';
import 'package:gotya/src/helpers/colors.dart';
import '../models/product.dart';

class ProductCardThumb extends StatelessWidget {
  final Product product;

  ProductCardThumb({this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: secondaryColor,
      margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 5.0),
      child: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              product.imagePath,
              width: 130,
              height: 150,
            ),
          ),
          Positioned(
            left: 3.0,
            top: 3.0,
            child: Text(
              product.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

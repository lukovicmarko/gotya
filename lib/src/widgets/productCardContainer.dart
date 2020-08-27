import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gotya/src/helpers/styleHelper.dart';
import 'package:gotya/src/widgets/favoriteButton.dart';
import 'package:gotya/src/widgets/openModalButton.dart';
import '../helpers/colors.dart';
import '../helpers/formatPrice.dart';
import '../models/product.dart';

FormatPrice formatPrice = FormatPrice();

class ProductCardContainer extends StatefulWidget {
  ProductCardContainer({Key key, this.product}) : super(key: key);

  final Product product;
  @override
  _ProductCardContainerState createState() => _ProductCardContainerState();
}

class _ProductCardContainerState extends State<ProductCardContainer> {
  @override
  void initState() {
    formatPrice.printPrice(widget.product);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200, //135
      child: Stack(
        children: <Widget>[
          Hero(
            tag: widget.product.image,
            child: Image.asset(
              widget.product.image,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 10.0,
            top: 10.0,
            child: Text(widget.product.name, style: title),
          ),
          Positioned(
            right: 50.0,
            child: IconButton(
              icon: Icon(
                FontAwesomeIcons.shareAlt,
              ),
              onPressed: () {},
            ),
          ),
          Positioned(
            right: 10.0,
            top: 10.0,
            child: FavoriteButton(
              product: widget.product,
            ),
          ),
          Positioned(
            top: 60.0,
            right: 10.0,
            child: Container(
              width: 70.0,
              height: 65.0,
              decoration: BoxDecoration(
                color: secondaryColor,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 6,
                  color: Colors.white,
                  style: BorderStyle.solid,
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: OpenModalButton(
                    product: widget.product,
                    icon: Icons.add_shopping_cart,
                    iconSize: 33.0,
                  )),
            ),
          ),
          Positioned(
              bottom: 10.0,
              right: 15.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    'KWD ${formatPrice.price}.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${formatPrice.remainder}0',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                ],
              )),
          Positioned(
            bottom: 10.0,
            left: 10.0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      widget.product.rating.toString(),
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    Icon(
                      FontAwesomeIcons.solidStar,
                      size: 22,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

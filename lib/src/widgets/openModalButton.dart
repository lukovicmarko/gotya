import 'package:flutter/material.dart';
// import 'package:gotya/src/data/cartData.dart';
// import 'package:gotya/src/data/productsData.dart';
import 'package:gotya/src/models/product.dart';
import 'package:gotya/src/widgets/addProduct.dart';
import 'package:gotya/src/widgets/showModal.dart';
// import 'package:provider/provider.dart';

class OpenModalButton extends StatelessWidget {
  OpenModalButton({
    this.product,
    this.buttonColor,
    this.iconColor,
    this.iconSize,
    this.icon,
  });

  final Product product;
  final Color buttonColor;
  final Color iconColor;
  final double iconSize;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    //final cart = Provider.of<CartData>(context);
    return GestureDetector(
      onTap: () {
        // if (icon == Icons.add_shopping_cart) {
        //   cart.resetProduct(product);
        // }
        showModal(
          context,
          Center(
            child: Material(
              child: Container(
                color: Colors.white,
                child: AddProduct(product: product, icon: icon),
              ),
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: buttonColor,
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}

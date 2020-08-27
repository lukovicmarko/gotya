import 'package:flutter/material.dart';
import 'package:gotya/src/data/cartData.dart';
import 'package:gotya/src/helpers/colors.dart';
import 'package:gotya/src/widgets/cartProductView.dart';
import 'package:gotya/src/widgets/checkout.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartData>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          color: secondaryColor,
          width: double.infinity,
          height: 75.0,
          padding: EdgeInsets.only(left: 10.0),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  cart.emptyCart();
                },
                child: Icon(
                  Icons.shopping_cart,
                  size: 40.0,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "This is the content of your shopping cart. Please verify the content carefuly and continue to the checkout!",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        CartProductView(),
        Checkout(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gotya/src/data/cartData.dart';
import 'package:gotya/src/widgets/productCard.dart';
import 'package:gotya/src/widgets/productCardChild.dart';
import 'package:gotya/src/widgets/productOptions.dart';
import 'package:provider/provider.dart';

class CartProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<CartData>(builder: (context, cartData, child) {
        return ListView.builder(
            itemCount: cartData.cartCount,
            itemBuilder: (BuildContext context, int index) {
              return ProductCard(
                countValue: 1,
                product: cartData.cart[index],
                options: ProductOptions(product: cartData.cart[index]),
                cardChild: ProductCardChild(product: cartData.cart[index]),
              );
            });
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gotya/src/data/cartData.dart';
import 'package:gotya/src/helpers/colors.dart';
import 'package:gotya/src/provider/listModeView.dart';
import 'package:gotya/src/widgets/openModalButton.dart';
import 'package:gotya/src/widgets/productCard.dart';
import 'package:gotya/src/widgets/productCardChild.dart';
import 'package:provider/provider.dart';
import '../data/productsData.dart';

class ProductCardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsData>(context).products;
    final cart = Provider.of<CartData>(context);
    final listMode = Provider.of<ListModeView>(context);

    return Expanded(
      child: products.length != 0
          ? GridView.count(
              crossAxisCount: listMode.countValue,
              childAspectRatio: (listMode.aspectWidth / listMode.aspectHeight),
              children: List.generate(products.length, (index) {
                final productInCart =
                    cart.getProductByID(products[index].id, cart.cart);
                return ProductCard(
                  countValue: listMode.countValue,
                  product: products[index],
                  cardChild: productInCart == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: 50.0,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 2.0,
                                      horizontal: 3.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          products[index].rating.toString(),
                                          style: TextStyle(
                                            fontSize: 19.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 21.0,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'buy now',
                                      style: TextStyle(
                                        color: secondaryColor,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'Arial',
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    OpenModalButton(
                                      buttonColor: secondaryColor,
                                      iconColor: Colors.white,
                                      iconSize: 25.0,
                                      icon: Icons.add_shopping_cart,
                                      product: products[index],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Price: ',
                                    ),
                                    Text(
                                      '${products[index].price}00 KD',
                                    ),
                                  ],
                                ),
                                Text(
                                  '${products[index].unitPrice}',
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Preparation time: ',
                                ),
                                Text(
                                  '${products[index].preparationTime}',
                                ),
                              ],
                            ),
                          ],
                        )
                      : ProductCardChild(product: productInCart),
                );
              }),
            )
          : Center(
              child: Text('Loading...'),
            ),
    );
  }
}

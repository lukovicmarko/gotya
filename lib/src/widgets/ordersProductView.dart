import 'package:flutter/material.dart';
import 'package:gotya/src/helpers/colors.dart';
import 'package:gotya/src/models/order.dart';
import 'package:gotya/src/widgets/openModalButton.dart';
import 'package:gotya/src/widgets/productCard.dart';

class OrdersProductView extends StatelessWidget {
  OrdersProductView({this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: order.products.length == 1 ? 135.0 : 270.0,
      child: ListView(
        children: order.products.map((product) {
          return ProductCard(
            countValue: 1,
            product: product,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '${product.quantity} ${product.quantity == 1 ? 'Cup' : 'Cups'}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0,
                        ),
                      ),
                    ),
                    OpenModalButton(
                      buttonColor: secondaryColor,
                      iconColor: Colors.white,
                      iconSize: 25.0,
                      icon: Icons.add_shopping_cart,
                      product: product,
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Price: ',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                '${product.price}00 KD',
                                style: TextStyle(
                                  fontSize: 17.5,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Amount: ',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            '${product.total}00 KD',
                            style: TextStyle(
                              fontSize: 17.5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

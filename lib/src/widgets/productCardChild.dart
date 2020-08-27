import 'package:flutter/material.dart';
import 'package:gotya/src/data/cartData.dart';
import 'package:gotya/src/models/product.dart';
import 'package:gotya/src/data/productsData.dart';
import 'package:gotya/src/helpers/colors.dart';
import 'package:gotya/src/widgets/openModalButton.dart';
import 'package:provider/provider.dart';

class ProductCardChild extends StatelessWidget {
  ProductCardChild({this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsData>(context);
    final cart = Provider.of<CartData>(context);
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Are you sure ?'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('No'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  FlatButton(
                                    child: Text('Yes'),
                                    onPressed: () {
                                      Provider.of<CartData>(context)
                                          .removeFromCart(product);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                      child: Icon(
                        Icons.remove_shopping_cart,
                        color: secondaryColor,
                        size: 28.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8.0,
                      ),
                      child: Column(
                        children: <Widget>[
                          Text(
                            '${product.quantity}',
                            style: TextStyle(
                              color: secondaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${product.quantity == 1 ? 'cup' : 'cups'}',
                            style: TextStyle(
                              color: secondaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    OpenModalButton(
                      buttonColor: Colors.white,
                      iconColor: secondaryColor,
                      iconSize: 25.0,
                      icon: Icons.add_shopping_cart,
                      product:
                          cart.getProductByID(product.id, products.products),
                    ),
                    OpenModalButton(
                      buttonColor: Colors.white,
                      iconColor: secondaryColor,
                      iconSize: 25.0,
                      icon: Icons.edit,
                      product: product,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Price:',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    Text(
                      '${product.price.toStringAsFixed(3)} KD',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Amount:',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Text(
                        '${product.total.toStringAsFixed(3)} KD',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Preparation time:',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Text(
                        '${product.preparationTime}',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipPath(
                clipper: UpArrow(),
                child: GestureDetector(
                  onTap: () {
                    Provider.of<CartData>(context).incrementQuantity(product);
                  },
                  child: Container(
                    width: 35.0,
                    height: 55.0,
                    color: secondaryColor,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        '+',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ClipPath(
                clipper: DownArrow(),
                child: GestureDetector(
                  onTap: () {
                    Provider.of<CartData>(context).decrementQuantity(product);
                  },
                  child: Container(
                    width: 35.0,
                    height: 55.0,
                    color: secondaryColor,
                    child: Text(
                      '-',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//drow up arrow
class UpArrow extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.35);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(UpArrow oldClipper) => false;
}

//drow down arrow
class DownArrow extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height * 0.65);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(DownArrow oldClipper) => false;
}

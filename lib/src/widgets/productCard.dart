import 'package:flutter/material.dart';
import 'package:gotya/src/data/cartData.dart';
import 'package:gotya/src/data/productsData.dart';
import 'package:gotya/src/pages/productsDetailsPage.dart';
import 'package:gotya/src/provider/bottomNavigationBar.dart';
import 'package:gotya/src/widgets/favoriteButton.dart';
import 'package:gotya/src/widgets/openModalButton.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import 'package:gotya/src/helpers/colors.dart';

class ProductCard extends StatelessWidget {
  ProductCard({this.product, this.countValue, this.cardChild, this.options});

  final Product product;
  final int countValue;
  final Widget cardChild;
  final Widget options;

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsData>(context);
    final cart = Provider.of<CartData>(context);

    if (countValue == 1) {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.black,
            ),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: 136.0,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                child: Row(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          width: 175.0,
                          child: Image.asset(
                            product.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 0.0,
                          right: 0.0,
                          bottom: 0.0,
                          child: GestureDetector(
                            onTap: () {
                              var provider =
                                  Provider.of<BottomNavigationBarProvider>(
                                      context);
                              provider.currentPage =
                                  ProductsDetailsPage(product: product);
                            },
                            child: Container(
                              width: 190.0,
                              padding: EdgeInsets.only(
                                top: 5.0,
                                right: 10.0,
                                bottom: 5.0,
                              ),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.8),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: 18.0),
                                        child: Container(
                                          width: 160.0,
                                          child: Text(
                                            product.name,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 23.0,
                                            ),
                                            maxLines: 2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      FavoriteButton(
                                        product: product,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: cardChild,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: options,
            ),
          ],
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            right: BorderSide(width: 1, color: Colors.black),
            bottom: BorderSide(width: 1, color: Colors.black),
          ),
        ),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                      width: double.infinity,
                      height: 124.0,
                      child: Image.asset(
                        product.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      right: 0.0,
                      bottom: 0.0,
                      child: GestureDetector(
                        onTap: () {
                          var provider =
                              Provider.of<BottomNavigationBarProvider>(context);
                          provider.currentPage =
                              ProductsDetailsPage(product: product);
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                          padding: EdgeInsets.only(left: 10.0),
                          height: 124.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.8),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  product.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 21.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 2.0,
                      top: 2.0,
                      child: OpenModalButton(
                        buttonColor: secondaryColor,
                        iconColor: Colors.white,
                        iconSize: 33.0,
                        icon: Icons.add_shopping_cart,
                        product:
                            cart.getProductByID(product.id, products.products),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: FavoriteButton(
                      product: product,
                    ),
                  ),
                  Container(
                    width: 50.0,
                    margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 2.0,
                        horizontal: 3.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            product.rating.toString(),
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
                  )
                ],
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Preparation time: ${product.preparationTime}',
                          ),
                          Text(
                            'Price: ${product.price}00 KD',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}

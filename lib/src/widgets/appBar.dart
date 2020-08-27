import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:gotya/src/data/cartData.dart';
import 'package:gotya/src/helpers/colors.dart';
import 'package:gotya/src/provider/bottomNavigationBar.dart';
import 'package:provider/provider.dart';

Widget buildAppBar(context) {
  final provider = Provider.of<BottomNavigationBarProvider>(context);
  return AppBar(
    elevation: 0.0,
    title: Text(
      "JustGetIt",
      style: TextStyle(
        color: secondaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
    ),
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: Icon(
            Icons.menu,
            size: 40,
            color: secondaryColor,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      },
    ),
    backgroundColor: Colors.white,
    actions: <Widget>[
      Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: IconButton(
          icon: Consumer<CartData>(
            builder: (context, cart, _) => Badge(
              badgeColor: colorRed,
              badgeContent: Text(
                cart.cartCount.toString(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              animationType: BadgeAnimationType.scale,
              animationDuration: Duration(milliseconds: 200),
              child: Icon(
                Icons.shopping_cart,
                size: 36,
                color: secondaryColor,
              ),
            ),
          ),
          onPressed: () {
            provider.currentIndex = 4;
          },
        ),
      ),
    ],
  );
}

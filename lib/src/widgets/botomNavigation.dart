import 'package:flutter/material.dart';
import 'package:gotya/src/helpers/colors.dart';
import 'package:gotya/src/provider/bottomNavigationBar.dart';

BottomNavigationBar buildBottomNavigationBar(
    BottomNavigationBarProvider provider) {
  return BottomNavigationBar(
    onTap: (int index) {
      provider.currentIndex = index;
    },
    currentIndex: provider.currentIndex,
    type: BottomNavigationBarType.fixed,
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite,
          color: Colors.black,
        ),
        title: Container(),
        activeIcon: Icon(
          Icons.favorite,
          color: colorGrey,
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.card_giftcard,
          color: Colors.black,
        ),
        title: Container(),
        activeIcon: Icon(
          Icons.card_giftcard,
          color: colorGrey,
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: Colors.black,
          size: 32.0,
        ),
        title: Container(),
        activeIcon: Icon(
          Icons.home,
          size: 32.0,
          color: colorGrey,
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.shop,
          color: Colors.black,
        ),
        title: Container(),
        activeIcon: Icon(
          Icons.shop,
          color: colorGrey,
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.shopping_cart,
          color: Colors.black,
        ),
        title: Container(),
        activeIcon: Icon(
          Icons.shopping_cart,
          color: colorGrey,
        ),
      ),
    ],
  );
}

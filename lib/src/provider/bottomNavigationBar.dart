import 'package:flutter/material.dart';
import 'package:gotya/src/pages/favoritesPage.dart';
import 'package:gotya/src/pages/homePage.dart';
import 'package:gotya/src/pages/ordersPage.dart';
import 'package:gotya/src/pages/productsPage.dart';
import 'package:gotya/src/pages/cartPage.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 2;
  Widget _currentPage = HomePage();

  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    _currentPage = tabs[index];

    notifyListeners();
  }

  final tabs = [
    FavoritesPage(),
    OrdersPage(),
    HomePage(),
    ProductsPage(),
    CartPage(),
  ];

  get currentPage => _currentPage;

  set currentPage(Widget page) {
    _currentPage = page;
    notifyListeners();
  }
}

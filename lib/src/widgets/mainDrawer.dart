import 'package:flutter/material.dart';
import 'package:gotya/src/pages/categoriesPage.dart';
import 'package:gotya/src/pages/profilePage.dart';
import 'package:gotya/src/provider/bottomNavigationBar.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  Widget listTile(String title, Function tapHandler) {
    return ListTile(
      title: Text(
        title,
        // textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          listTile(
            'Products',
            () {
              provider.currentIndex = 3;
              Navigator.of(context).pop();
            },
          ),
          listTile(
            'Categories',
            () {
              provider.currentPage = CategoriesPage();
              Navigator.of(context).pop();
            },
          ),
          listTile(
            'Brands',
            () {},
          ),
          listTile(
            'Business',
            () {},
          ),
          listTile(
            'Locations',
            () {},
          ),
          listTile(
            'Favorites',
            () {},
          ),
          listTile(
            'Popular',
            () {},
          ),
          listTile(
            'Orders',
            () {
              provider.currentIndex = 1;
              Navigator.of(context).pop();
            },
          ),
          listTile(
            'Settings',
            () {},
          ),
          listTile(
            'My Profile',
            () {
              provider.currentPage = ProfilePage();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

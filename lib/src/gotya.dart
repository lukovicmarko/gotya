import 'package:flutter/material.dart';
import 'package:gotya/src/data/cartData.dart';
import 'package:gotya/src/data/productsData.dart';
import 'package:gotya/src/provider/bottomNavigationBar.dart';
import 'package:gotya/src/provider/listModeView.dart';
import 'package:provider/provider.dart';
import 'data/ordersData.dart';
import 'helpers/colors.dart';
import 'screens/mainScreen.dart';

class GotYaApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => ProductsData(),
        ),
        ChangeNotifierProvider(
          builder: (context) => OrdersData(),
        ),
        ChangeNotifierProvider(
          builder: (context) => BottomNavigationBarProvider(),
        ),
        ChangeNotifierProvider(
          builder: (context) => CartData(),
        ),
        ChangeNotifierProvider(
          builder: (context) => ListModeView(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, //removes debug banner
        title: 'GotYa',
        theme: ThemeData(
          primaryColor: primaryColor,
          accentColor: secondaryColor,
          textTheme: TextTheme(
            bodyText1: TextStyle(fontSize: 15.5),
            bodyText2: TextStyle(fontSize: 15.5),
          ),
        ),
        home: MainScreen(),
      ),
    );
  }
}

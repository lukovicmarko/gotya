import 'package:flutter/material.dart';
import 'package:gotya/src/widgets/breadCrumbs.dart';
import '../widgets/cardTitleText.dart';
import '../widgets/popularView.dart';
import '../widgets/searchField.dart';
import '../widgets/nearByView.dart';
import '../widgets/categoryView.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BreadCrumbs(),
          Row(
            children: <Widget>[
              SearchField(),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          CardTitleText('Nearby'),
          NearByView(),
          CardTitleText('Category'),
          CategoryView(),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Popular',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          PopularView(),
          //Popular
        ],
      ),
    );
  }
}

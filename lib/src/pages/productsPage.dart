import 'package:flutter/material.dart';
import 'package:gotya/src/widgets/breadCrumbs.dart';
import 'package:gotya/src/widgets/categorySelector.dart';
import 'package:gotya/src/widgets/listMode.dart';
import 'package:gotya/src/widgets/productCardView.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BreadCrumbs(),
        ListMode(),
        CategorySelector(),
        ProductCardView(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/productsData.dart';
import '../widgets/productCardTamb.dart';

class ProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var products = Provider.of<ProductsData>(context).products;
    return Container(
      height: 80.0,
      margin: EdgeInsets.symmetric(horizontal: 3.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductCardThumb(product: products[index]);
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gotya/src/data/productsData.dart';
import 'package:gotya/src/helpers/colors.dart';
import 'package:gotya/src/models/product.dart';
import 'package:provider/provider.dart';

class SliderRange extends StatelessWidget {
  SliderRange({this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsData>(context);
    return Slider(
      value: product.options[0].items[1].price,
      divisions: 2,
      min: product.options[0].items[0].price,
      max: product.options[0].items[2].price,
      activeColor: secondaryColor,
      inactiveColor: secondaryColor,
      onChanged: (double newValue) {
        products.sliderOptions(product, newValue);
      },
    );
  }
}

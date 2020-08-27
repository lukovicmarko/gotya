import 'package:flutter/material.dart';
import 'package:gotya/src/data/productsData.dart';
import 'package:gotya/src/helpers/colors.dart';
import 'package:gotya/src/models/product.dart';
import 'package:provider/provider.dart';

class ModalCheckBox extends StatelessWidget {
  ModalCheckBox({this.product, this.index});

  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsData>(context);
    return Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: Row(
        children: <Widget>[
          Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: secondaryColor,
            ),
            child: Checkbox(
              value: product.options[1].items[index].isActive,
              onChanged: (newValue) {
                products.toggleCheckBox(product, index, newValue);
              },
            ),
          ),
          Text(product.options[1].items[index].name),
        ],
      ),
    );
  }
}

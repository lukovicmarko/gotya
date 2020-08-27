import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:gotya/src/models/product.dart';

class ProductOptions extends StatelessWidget {
  ProductOptions({this.product});
  final Product product;

  buildActiveItems(items) {
    List newItems = [];

    items.forEach((item) {
      if (item.isActive) {
        newItems.add(item);
      }
    });

    return newItems;
  }

  @override
  Widget build(BuildContext context) {
    List items = buildActiveItems(product.options[1].items);
    return Container(
      color: Colors.grey[200],
      height: buildActiveItems(items).length != 0 ? 21.0 : 0.0,
      padding: EdgeInsets.symmetric(vertical: 2.0),
      alignment: Alignment.center,
      child: buildActiveItems(items).length != 0
          ? BreadCrumb.builder(
              itemCount: buildActiveItems(items).length,
              builder: (index) {
                return BreadCrumbItem(
                  content: Text(
                    items[index].name,
                  ),
                );
              },
              divider: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Icon(
                  Icons.lens,
                  size: 8.0,
                ),
              ),
            )
          : Container(),
    );
  }
}

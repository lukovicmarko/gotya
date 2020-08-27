import 'package:flutter/material.dart';
import 'package:gotya/src/widgets/breadCrumbs.dart';
import 'package:gotya/src/widgets/ordersView.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BreadCrumbs(),
        Expanded(
          child: ListView(
            children: <Widget>[
              OrdersView(),
            ],
          ),
        ),
      ],
    );
  }
}

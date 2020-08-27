import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './ordersCard.dart';
import '../data/ordersData.dart';

class OrdersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<OrdersData>(context, listen: false).getOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.error != null) {
              //Do error handling
              return Center(
                child: Text('An error occurred!'),
              );
            } else {
              return Consumer<OrdersData>(
                builder: (context, orders, child) => ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: orders.orders.length,
                  itemBuilder: (BuildContext context, int index) {
                    return OrdersCard(order: orders.orders[index]);
                  },
                ),
              );
            }
          }
        });
  }
}

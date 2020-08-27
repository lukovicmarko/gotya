import 'package:flutter/material.dart';
import 'package:gotya/src/helpers/colors.dart';
import 'package:gotya/src/models/product.dart';

class DeliveryTimeCard extends StatelessWidget {
  DeliveryTimeCard({this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(left: 8.0, right: 3.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Text(
                'Delivery estimation: ${product.deliveryEstimation}',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            FlatButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              color: secondaryColor,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Pick up',
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onPressed: () => print('Search'),
            ),
          ],
        ),
      ),
    );
  }
}

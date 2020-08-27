import 'package:flutter/material.dart';
import 'package:gotya/src/data/cartData.dart';
import 'package:gotya/src/helpers/colors.dart';
import 'package:gotya/src/pages/checkoutPage.dart';
import 'package:gotya/src/widgets/checkoutButton.dart';
import 'package:provider/provider.dart';

import '../provider/bottomNavigationBar.dart';

class Checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final totalAmount = Provider.of<CartData>(context).getTotalAmount();
    final cartCount = Provider.of<CartData>(context).cartCount;
    return Container(
      height: 110.0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(width: 0.5, color: secondaryColor),
          bottom: BorderSide(width: 0.5, color: secondaryColor),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Total Amount:',
                style: TextStyle(fontSize: 22.0),
              ),
              Text(
                '${totalAmount == 0 ? totalAmount.toStringAsFixed(0) : totalAmount.toStringAsFixed(3)} KD',
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CheckoutButton(
                text: 'Checkout',
                checkboxValue: cartCount > 0,
                onPress: () {
                  var provider =
                      Provider.of<BottomNavigationBarProvider>(context);
                  provider.currentPage = CheckoutPage(totalAmount: totalAmount);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

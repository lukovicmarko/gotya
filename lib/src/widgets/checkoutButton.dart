import 'package:flutter/material.dart';

import '../helpers/colors.dart';

class CheckoutButton extends StatelessWidget {
  CheckoutButton({this.text, this.onPress, this.checkboxValue, this.color});
  final String text;
  final Function onPress;
  final bool checkboxValue;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      textColor: Colors.white,
      color: secondaryColor,
      disabledColor: primaryColor,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          color: checkboxValue ? Colors.white : Colors.grey[300],
        ),
      ),
      onPressed: checkboxValue ? onPress : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}

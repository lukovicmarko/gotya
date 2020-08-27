import 'package:flutter/material.dart';
import 'package:gotya/src/helpers/colors.dart';

class FollowButton extends StatelessWidget {
  FollowButton({this.text, this.onPress});

  final String text;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RaisedButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        color: secondaryColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onPressed: onPress,
      ),
    );
  }
}

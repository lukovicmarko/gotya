import 'package:flutter/material.dart';
import 'package:gotya/src/helpers/colors.dart';

class Followers extends StatelessWidget {
  Followers({this.text, this.numberOfFollowers});

  final String text;
  final String numberOfFollowers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(color: secondaryColor),
        ),
        Text(
          numberOfFollowers,
          style: TextStyle(
            color: secondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }
}

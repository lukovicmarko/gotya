import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gotya/src/helpers/colors.dart';

class OrdersRow extends StatelessWidget {
  OrdersRow({this.title, this.label, this.color, this.rating});

  final String title;
  final String label;
  final Color color;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 17.0,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 17.0,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Text(
              rating.toString(),
              style: TextStyle(
                color: secondaryColor,
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 5.0, right: 3.0),
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: secondaryColor,
                size: 18.0,
              ),
            ),
          ],
        )
      ],
    );
  }
}

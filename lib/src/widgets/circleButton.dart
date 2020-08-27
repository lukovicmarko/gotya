import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  CircleButton({this.color, this.buttonChild, this.height, this.width});

  final Color color;
  final Widget buttonChild;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: buttonChild,
    );
  }
}

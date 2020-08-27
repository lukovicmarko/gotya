import 'package:flutter/material.dart';

class QuantityUpButton extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0.0, size.height * 0.4);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.4);
    path.lineTo(size.width * 0.5, 0.0);

    return path;
  }

  @override
  bool shouldReclip(oldClipper) => false;
}

class QuantityDownButton extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height * 0.6);
    path.lineTo(size.width * 0.5, size.height);
    path.lineTo(size.width, size.height * 0.6);
    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(oldClipper) => false;
}

import 'package:flutter/material.dart';

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;
    double curveHeight = height * 0.15;
    double curvePosition = height * 0.7;

    path.moveTo(0, 0);
    path.lineTo(0, curvePosition);

    path.quadraticBezierTo(
      width / 2,
      curvePosition + curveHeight,
      width,
      curvePosition,
    );

    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

import 'package:flutter/material.dart';

class LoginClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    path.quadraticBezierTo(size.width * 0.20, size.height * 0.6,
        size.width * 0.5, size.height * 0.65);
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.70, size.width, size.height * 0.4);

    path.lineTo(size.width, size.height * 0.4);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

import 'package:flutter/material.dart';

class RectHomeClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double h = size.height;
    double w = size.width;

    path.lineTo(0, h);
    path.lineTo(w * 0.20, h);

    // path.lineTo(w*0.60, h*0.90);
    path.lineTo(w * 0.56, h * 0.90);
    // path.lineTo(w*0.64, h*0.86);
    path.quadraticBezierTo(w * 0.602, h * 0.895, w * 0.63, h * 0.82);

    // path.lineTo(w*0.8, h*0.3);
    path.lineTo(w * 0.835, h * 0.30);
    // path.lineTo(w*0.84, h*0.26);
    path.quadraticBezierTo(w * 0.85, h * 0.26, w * 0.84, h * 0.26);

    path.lineTo(w * 0.5, 0);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

class RectHomeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double h = size.height;
    double w = size.width;

    path.lineTo(0, h);
    path.lineTo(w * 0.20, h);

    // path.lineTo(w*0.60, h*0.90);
    path.lineTo(w * 0.58, h * 0.92);
    // path.lineTo(w*0.64, h*0.86);
    path.quadraticBezierTo(w * 0.62, h * 0.91, w * 0.64, h * 0.86);

    // path.lineTo(w*0.8, h*0.3);
    path.lineTo(w * 0.85, h * 0.33);
    // path.lineTo(w*0.84, h*0.26);
    path.quadraticBezierTo(w * 0.87, h * 0.28, w * 0.84, h * 0.26);

    path.lineTo(w * 0.5, 0);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

class HomeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double h = size.height;
    double w = size.width;
    path.lineTo(0, h);
    //
    path.lineTo(w * 0.60, h);

    // path.lineTo(w * 0.70, h*0.95);
    path.quadraticBezierTo(w * 0.69, h, w * 0.70, h * 0.90);

    path.quadraticBezierTo(w * 0.72, h * 0.70, w * 0.80, h * 0.70);
    path.quadraticBezierTo(w * 0.88, h * 0.70, w * 0.90, h * 0.90);

    // path.lineTo(w * 0.95, h);
    path.quadraticBezierTo(w * 0.91, h, w, h);
    // path.lineTo(w, h);
    //
    path.lineTo(w, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

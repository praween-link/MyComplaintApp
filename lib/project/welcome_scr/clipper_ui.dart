import 'package:complaintapp/decorations/colors/mycolor.dart';
import 'package:flutter/material.dart';

class WelcomeClipperUI extends StatelessWidget {
  const WelcomeClipperUI({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipPath(
          child: Container(
            height: h * 0.40,
            decoration: BoxDecoration(
              color: MyColor.welcomeScrClip['box'],
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: MyColor.welcomeScrClip['colors1'],
                stops: const [0, 0.1, 0.3, 1],
              ),
            ),
          ),
          clipper: WelcomeTopClipper(),
        ),
        ClipPath(
          child: Container(
            height: h * 0.40,
            decoration: BoxDecoration(
              color: MyColor.welcomeScrClip['box'],
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: MyColor.welcomeScrClip['colors2'],
                stops: const [0.3, 0.68, 0.89, 0.9],
              ),
            ),
          ),
          clipper: WelcomeBottomClipper(),
        ),
      ],
    );
  }
}


class WelcomeBottomClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    double h = size.height;
    double w = size.width;

    path.lineTo(w * 0.25, h);
    path.lineTo(w, h);
    path.lineTo(w, 0);
    path.quadraticBezierTo(w * 0.97, h * 0.34, w * 0.54, h * 0.57);
    path.quadraticBezierTo(w * 0.27, h * 0.72, w * 0.25, h);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

class WelcomeTopClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    double h = size.height;
    double w = size.width;

    path.lineTo(0, h);
    path.quadraticBezierTo(w * 0.08, h * 0.6, w * 0.35, h * 0.45);
    path.quadraticBezierTo(w * 0.70, h * 0.25, w * 0.75, 0);

    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

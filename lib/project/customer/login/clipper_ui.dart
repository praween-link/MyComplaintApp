import 'package:complaintapp/project/constants/login_clipper.dart';
import 'package:flutter/material.dart';

class LoginClipperUI extends StatelessWidget {
  const LoginClipperUI({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.50,
        decoration: const BoxDecoration(
          color: Colors.blue,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
                    Color(0xFF614ac2),
                    Color(0xFF391e8a),
                    Color(0xFF270980),
                    Color(0xFF270980),
                    Color(0xFF755fcf),
                    Color(0xFF391e8a),
                    Color(0xFF270980),
                    Color(0xFF614ac2),
                  ],
                  stops: [0.15, 0.3, 0.4, 0.4, 0.55, 0.6, 0.6, 0.7],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 0, bottom: 175, left: 28.0, right: 28.0),
          child: Stack(
            children: [
              Center(child: Image.asset('assets/img/logo.png')),
              const Padding(
                padding: EdgeInsets.only(top: 210.0),
                child: Center(
                  child: Text(
                    "Complaint Signup",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              // SizedBox(height: 20)
            ],
          ),
        ),
      ),
      clipper: LoginClipper(),
    );
  }
}


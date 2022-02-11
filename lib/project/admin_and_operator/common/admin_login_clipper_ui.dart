import 'package:complaintapp/project/constants/login_clipper.dart';
import 'package:flutter/material.dart';

class AdminLoginClipperUI extends StatelessWidget {
  const AdminLoginClipperUI({
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
            ],
            stops: [0.15, 0.4, 0.4, 0.05, 0.5],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 50.0, bottom: 155, left: 28.0, right: 28.0),
          child: Stack(
            children: [
              Center(child: Image.asset('assets/img/loginlogo.png')),
              const Padding(
                padding: EdgeInsets.only(top: 130.0),
                child: Center(
                  child: Text(
                    "Complaint Signup",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
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


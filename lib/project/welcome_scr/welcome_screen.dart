import 'package:complaintapp/project/admin_and_operator/common/login_screen.dart';
import 'package:complaintapp/project/constants/decorations.dart';
import 'package:complaintapp/project/customer/login/customer_sign.dart';
import 'package:complaintapp/project/welcome_scr/clipper_ui.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  static const routeName = '/welcome';
  Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          const WelcomeClipperUI(),
          //
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, CustomerLogin.routeName),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 28.0, right: 28.0, bottom: 10),
                  child: Container(
                    height: 80,
                    child: const Center(
                      child: Text(
                        "Customer",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    decoration: welcomeBoxDecoration1,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 28.0, right: 28.0, top: 10),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, AdminAndOperatorLogin.routeName),
                  child: Container(
                    height: 80,
                    child: const Center(
                      child: Text(
                        'data',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    decoration: welcomeBoxDecoration2,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

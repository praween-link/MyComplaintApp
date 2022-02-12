import 'package:complaintapp/project/controller/admin_controller.dart';
import 'package:complaintapp/project/controller/customer_controller.dart';
import 'package:complaintapp/project/constants/login_clipper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';

import '../../customer_drawer.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class CustomerHome extends StatelessWidget {
  static const routeName = '/customerhome';

  CustomerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var customerController = Provider.of<CustomerController>(context);
    var adminProvider = Provider.of<AdminController>(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    var boxDecoration = const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(200),
        bottomRight: Radius.circular(200),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
      color: Colors.blue,
      // shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Color(0xff9fa1ab),
          offset: Offset(2, 0),
          blurRadius: 8,
          spreadRadius: 1,
        ),
        BoxShadow(
          color: Color(0xff9fa1ab),
          offset: Offset(4, 5),
          blurRadius: 8,
          spreadRadius: 1,
        ),
      ],
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF755fcf),
          Color(0xFF755fcf),
          Color(0xFF755fcf),
          Color(0xFF0B0B3B),
        ],
        stops: [0, 0.1, 0.3, 1],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color(0xFF755fcf),
        elevation: 30,
        leading: Builder(
          builder: (BuildContext context) => GestureDetector(
            child: Image.asset('assets/img/menu_icon.png'),
            onTap: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      // appBar: GradientAppBar(
      //   title: Text('Home-> ${provider.count}'),
      //   // backgroundColor: const Color(0xFF755fcf),
      //   elevation: 30,
      //   leading: Builder(
      //     builder: (BuildContext context) => GestureDetector(
      //       child: Image.asset('assets/img/menu_icon.png'),
      //       onTap: () => Scaffold.of(context).openDrawer(),
      //     ),
      //   ),
      //   gradient: const LinearGradient(
      //     begin: Alignment.topLeft,
      //     end: Alignment.bottomRight,
      //     colors: [
      //       Color(0xFF614ac2),
      //       Color(0xFF391e8a),
      //       Color(0xFF270980),
      //       Color(0xFF270980),
      //       Color(0xFF755fcf),
      //       Color(0xFF391e8a),
      //       Color(0xFF270980),
      //       Color(0xFF614ac2),
      //     ],
      //     stops: [0.15, 0.4, 0.5, 0.5, 0.6, 0.6, 0.7, 0.8],
      //   ),
      // ),
      body: Stack(
        children: [
          customerController.getGridViewComplaintTypesCustomer(),
          //-----
          ClipPath(
            child: Container(
              height: h * 0.35,
              width: w,
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
                  stops: [0.15, 0.4, 0.5, 0.5, 0.6, 0.6, 0.7, 0.8],
                ),
              ),
            ),
            clipper: LoginClipper(),
          ),
          //----------------------------------------------------------------
          SizedBox(
            height: h * 0.35,
            width: w,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 28, bottom: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Add New Complaint",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Our Services",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Select your complaint",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[400],
                    ),
                  ),
                  Text(
                    "type then continue!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: const CustomerDrawer(),
    );
  }
}

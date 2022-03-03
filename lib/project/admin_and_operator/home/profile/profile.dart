import 'dart:ui';

import 'package:complaintapp/project/admin_and_operator/admin/admin_drawer.dart';
import 'package:complaintapp/project/admin_and_operator/home/top_ui_part/top_clippers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'circular_image.dart';
import 'update/update_profile.dart';
FirebaseAuth _auth = FirebaseAuth.instance;

class Profile extends StatelessWidget {
  static const routeName = '/adminProfile';//adminProfile
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    // var bgimage = const NetworkImage(
    //     'https://www.awn.com/sites/default/files/styles/inline_wide/public/image/featured/1040167-original-songs-mexican-sounds-set-pixars-coco-soundtrack.jpg?itok=fCz310bu');
    var bgimage = const NetworkImage(
        'https://image.newyork.com.au/wp-content/uploads/2020/05/New-York-Skyline-Zoom.jpg');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xFF614ac2),
        elevation: 15,
        leading: Builder(
          builder: (BuildContext context) => GestureDetector(
            child: Image.asset('assets/img/menu_icon.png'),
            onTap: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdateProfile())), icon: const Icon(Icons.edit))
        ],
      ),
      // backgroundColor: Colors.blueGrey[200],
      body: Stack(
        children: [
          Container(),
          //
          Stack(
            children: [
              ClipPath(
                child: Container(
                  height: 205,
                  width: w,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      height: 100,
                      width: w,
                      decoration: BoxDecoration(
                        color: const Color(0xFF755fcf).withOpacity(0.2),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(400)),
                        // color: const Color(0xFF755fcf),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF614ac2),
                            Color(0xFF391e8a),
                            Color(0xFF270980),
                            Color(0xFF270980),
                            Color(0xFF755fcf),
                          ],
                          stops: [0.15, 0.4, 0.4, 0.4, 0.7],
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: bgimage,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(400)),
                    color: const Color(0xFF755fcf),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF614ac2),
                        Color(0xFF391e8a),
                        Color(0xFF270980),
                        Color(0xFF270980),
                        Color(0xFF755fcf),
                      ],
                      stops: [0.15, 0.4, 0.4, 0.4, 0.7],
                    ),
                  ),
                ),
                // clipper: HomeClipper(),
              ),
              ClipPath(
                child: Container(
                  height: 210,
                  width: w,
                  decoration: const BoxDecoration(
                    color: Color(0xFF270980),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(200)),
                  ),
                ),
                clipper: RectHomeClipper(),
              ),
              ClipPath(
                child: Container(
                  height: 210,
                  width: w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: bgimage,
                      fit: BoxFit.cover,
                    ),
                    color: const Color(0xFF391e8a),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(200)),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF391e8a),
                        Color(0xFF270980),
                        Color(0xFF270980),
                        Color(0xFF755fcf),
                      ],
                      stops: [0.0, 0.2, 0.1, 0.7],
                    ),
                  ),
                ),
                clipper: RectHomeClipper2(),
              ),
              // Positioned(
              //   bottom: 0,
              //   right: 51,
              //   child: Container(
              //     height: 55,
              //     width: 55,
              //     decoration: BoxDecoration(
              //       color: const Color(0xFF270980),
              //       borderRadius: BorderRadius.circular(50),
              //     ),
              //     child: IconButton(
              //       icon: const Icon(Icons.message_outlined,
              //           color: Colors.white, size: 30),
              //       onPressed: () {},
              //     ),
              //   ),
              // ),
              //
              const Positioned(
                bottom: 0,
                left: 15,
                child: CircularImage(imgurl:'https://jooinn.com/images/child-66.jpg',),
              ),
              //
            ],
          ),
          //
          Positioned(
            top: 230,
            left: 18,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    SizedBox(width: 8),
                    Text(
                      "P Kumar",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    SizedBox(width: 8),
                    Text(
                      "Admin Profile",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: const [
                    Icon(Icons.phone, size: 28, color: Colors.grey),
                    SizedBox(width: 20),
                    Text(
                      "+91 8507766280",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Icon(
                      Icons.email,
                      size: 28,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 20),
                    Text(
                      "pkumar.link@gmail.com",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Icon(
                      Icons.home,
                      size: 28,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 20),
                    Text(
                      "Purnea, Bihar!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // const Divider(color: Colors.grey,),
              ],
            ),
          ),
        ],
      ),
      drawer: const AdminDrawer(),
    );
  }
}
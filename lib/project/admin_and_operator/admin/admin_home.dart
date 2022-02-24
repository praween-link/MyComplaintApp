import 'package:complaintapp/project/admin_and_operator/admin/adduser/add_admin.dart';
import 'package:complaintapp/project/admin_and_operator/admin/adduser/add_operator.dart';
import 'package:complaintapp/project/controller/admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'admin_clippers/admin_clippers.dart';
import 'admin_drawer.dart';

class AdminHomeScreen extends StatelessWidget {
  static const routeName = '/adminHomeScreen';
  const AdminHomeScreen({Key? key, required this.isAdmin}) : super(key: key);
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AdminController>(context);
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home-> ${provider.count}|${provider.issues.length}'),
        backgroundColor: const Color(0xFF614ac2),
        elevation: 15,
        leading: Builder(
          builder: (BuildContext context) => GestureDetector(
            child: Image.asset('assets/img/menu_icon.png'),
            onTap: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      // backgroundColor: Colors.blueGrey[200],
      body: Stack(
        children: [
          provider.AdminIssuesListDataWidget(),
          // ListView.builder(
          //     itemCount: 3,
          //     itemBuilder: (context, int index) {
          //       return index == 0
          //           ? const SizedBox(
          //               height: 218,
          //             )
          //           : index == 1
          //               ? const MyAllComplaintInCount()
          //               : const Text("Hello");
          //       // : Expanded(child: provider.AdminIssuesListDataWidget());
          //     }),
          //
          //
          Stack(
            children: [
              ClipPath(
                child: Container(
                  height: 210,
                  width: w,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(200)),
                    color: Color(0xFF755fcf),
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
                      stops: [0.15, 0.4, 0.4, 0.4, 0.7],
                    ),
                  ),
                ),
                clipper: HomeClipper(),
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(height: 30),
                        Text(
                          'Hello',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'Praween Kumar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFF391e8a),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(200)),
                    gradient: LinearGradient(
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
              Positioned(
                bottom: 0,
                right: 51,
                child: Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: const Color(0xFF3815a1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: GestureDetector(
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: const Color(0xFF3815a1),
                        child: Image.asset('assets/img/menu_icon2.png'),
                      ),
                      onTap: () {
                        showModalBottomSheet<dynamic>(
                            // barrierColor: Colors.transparent,
                            backgroundColor: Colors.grey.withOpacity(0),
                            isScrollControlled: true,
                            context: (context),
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: h - 248,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 0,
                                      child: SizedBox(
                                        // color: Colors.grey.withOpacity(0.5),
                                        width: w,
                                        height: h - 302,
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 48,
                                      child: Container(
                                        width: 60,
                                        height: 250,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF24077a),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 16.0),
                                              child: IconButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                icon: Icon(
                                                  Icons.cancel,
                                                  size: 42,
                                                  color: Colors.grey[300],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 15),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 16.0),
                                              child: IconButton(
                                                onPressed: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const AddAdmin(),
                                                  ),
                                                ),
                                                icon: Icon(
                                                  Icons.add_circle,
                                                  size: 42,
                                                  color: Colors.grey[300],
                                                ),
                                              ),
                                            ),
                                            const Text(
                                              'Admin',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 15),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 16.0),
                                              child: IconButton(
                                                onPressed: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const AddOperator(),
                                                  ),
                                                ),
                                                icon: Icon(
                                                  Icons.add_circle,
                                                  size: 42,
                                                  color: Colors.grey[300],
                                                ),
                                              ),
                                            ),
                                            const Text(
                                              'Operator',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            // const SizedBox(height: 5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                    )),
              ),
              //
              //
            ],
          ),
          //
        ],
      ),
      drawer: const AdminDrawer(),
    );
  }
}

class MyAllComplaintInCount extends StatelessWidget {
  const MyAllComplaintInCount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                '50',
                style: TextStyle(
                  color: Colors.orange[500],
                  fontSize: 18,
                ),
              ),
              const Text(
                'new',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            children: const [
              Text(
                '60',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                ),
              ),
              Text(
                'process',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            children: const [
              Text(
                '48',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
              Text(
                'pending',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            children: const [
              Text(
                '50560',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                ),
              ),
              Text(
                'completed',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'dart:ui';

import 'package:complaintapp/project/admin_and_operator/admin/admin_clippers/admin_clippers.dart';
import 'package:complaintapp/project/controller/customer_controller.dart';
import 'package:complaintapp/project/customer/customer_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerViewComplaint extends StatelessWidget {
  static const routeName = '/viewComplaint'; //adminProfile
  CustomerViewComplaint({Key? key, required this.id}) : super(key: key);

  final String id;
  String status = '';

  @override
  Widget build(BuildContext context) {
    var customerProvider = Provider.of<CustomerController>(context);
    status = customerProvider.issuesstatus[id]!.status; //new.pending.process.completed
    String processStatus = customerProvider.issuesstatus[id]!.currentStatus; // recorded, assigned, traveling, done
    String statusRecordedDate = '18/02/2021 04:09pm';
    String statusAssignedDate = '19/02/2021 01:32pm';
    String statusTravelingDate = '19/02/2021 09:52pm';
    String statusDoneDate = '22/02/2021 04:30pm';

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    // var bgimage = const NetworkImage(
    //     'https://www.awn.com/sites/default/files/styles/inline_wide/public/image/featured/1040167-original-songs-mexican-sounds-set-pixars-coco-soundtrack.jpg?itok=fCz310bu');
    var bgimage = const NetworkImage(
        'https://image.newyork.com.au/wp-content/uploads/2020/05/New-York-Skyline-Zoom.jpg');

    return Scaffold(
      appBar: AppBar(
        title: const Text('View'),
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
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
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
                  Column(
                    children: [
                      SizedBox(
                        height: 220,
                        width: w,
                      ),
                      //
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, left: 36),
                        child: SizedBox(
                          width: w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'ID: ',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                id,
                                style: const TextStyle(),
                              )
                            ],
                          ),
                        ),
                      ),
                      //
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, left: 36),
                        child: SizedBox(
                          width: w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'Status: ',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              status == 'new'
                                  ? Text(
                                      status,
                                      style: TextStyle(
                                        color: Colors.orange[500],
                                        fontSize: 18,
                                      ),
                                    )
                                  : status == 'pending'
                                      ? Text(
                                          status,
                                          style: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 18,
                                          ),
                                        )
                                      : status == 'process'
                                          ? Text(
                                              status,
                                              style: TextStyle(
                                                color: Colors.grey[300],
                                                fontSize: 18,
                                              ),
                                            )
                                          : Text(
                                              status,
                                              style: const TextStyle(
                                                color: Colors.green,
                                                fontSize: 18,
                                              ),
                                            ),
                            ],
                          ),
                        ),
                      ),
                      //
                      Stack(
                        children: [
                          Container(
                              height: 350,
                              width: 20,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Container(
                                      height: 320,
                                      width: 5,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 14),
                                      Center(
                                        child: Container(
                                          height: processStatus == 'recorded'
                                              ? 0
                                              : processStatus == 'assigned'
                                                  ? 118
                                                  : processStatus == 'traveling'
                                                      ? 210
                                                      : 320, //320/
                                          width: 5,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                          backgroundColor: processStatus ==
                                                      'recorded' ||
                                                  processStatus == 'assigned' ||
                                                  processStatus ==
                                                      'traveling' ||
                                                  processStatus == 'done'
                                              ? Colors.green
                                              : Colors.grey[300]),
                                      CircleAvatar(
                                        backgroundColor: processStatus ==
                                                    'assigned' ||
                                                processStatus == 'traveling' ||
                                                processStatus == 'done'
                                            ? Colors.green
                                            : Colors.grey[300],
                                      ),
                                      CircleAvatar(
                                        backgroundColor:
                                            processStatus == 'traveling' ||
                                                    processStatus == 'done'
                                                ? Colors.green
                                                : Colors.grey[300],
                                      ),
                                      CircleAvatar(
                                        backgroundColor: processStatus == 'done'
                                            ? Colors.green
                                            : Colors.grey[300],
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          SizedBox(
                              height: 340,
                              width: w - 60,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 28.0,
                                    right: 8.0,
                                    top: 8.0,
                                    bottom: 0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('The issue has recorded.'),
                                        Text('☛  ${customerProvider.issuesstatus[id]!.dates['recorded']}'),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                            'The problem is assigned to the operator for the next processing.'),
                                        Text('☛  ${customerProvider.issuesstatus[id]!.dates['assigned']}'),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                            'The operator is coming for solving the issues.'),
                                        Text('☛  ${customerProvider.issuesstatus[id]!.dates['traveling']}'),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                            'The issue has been completed successfully.'),
                                        Text('☛  ${customerProvider.issuesstatus[id]!.dates['done']}'),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),

                      ///-----
                      const Text(
                          '-----------------------------------------------------------------------'),
                      const SizedBox(height: 20),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        width: w - 48,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [const Text(
                              "Type:         ",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              "☛  ${customerProvider.issues[id]!.type}",
                              style: const TextStyle(fontSize: 16),
                            ),],),
                            const SizedBox(height: 20),
                            Row(children: [const Text(
                              "Category:  ",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              "☛  ${customerProvider.issues[id]!.category}",
                              style: const TextStyle(fontSize: 16),
                            ),],),
                            const SizedBox(height: 20),
                            const Text(
                              "Title",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              "☛  ${customerProvider.issues[id]!.title}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Description",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              "☛  ${customerProvider.issues[id]!.description}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Customer Details",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            ListTile(
                              leading: const Icon(Icons.location_on),
                              title: Text(
                                '${customerProvider.issues[id]!.area}, ${customerProvider.issues[id]!.city}, ${customerProvider.issues[id]!.state}, ${customerProvider.issues[id]!.pincode}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            ListTile(
                              leading: const Icon(Icons.person),
                              title: Text(
                                customerProvider.issues[id]!.name,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            ListTile(
                              leading: const Icon(Icons.phone),
                              title: Text(
                                '+91 ${customerProvider.issues[id]!.phone}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            ListTile(
                              leading: const Icon(Icons.email),
                              title: Text(
                                customerProvider.issues[id]!.email,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              //
            ],
          ),
        ),
      ),
      drawer: const CustomerDrawer(),
    );
  }
}

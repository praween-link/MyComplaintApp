import 'package:complaintapp/project/admin_and_operator/admin/adduser/add_admin.dart';
import 'package:complaintapp/project/admin_and_operator/admin/assign/assign_issue.dart';
import 'package:complaintapp/project/admin_and_operator/admin/view/view_complaint.dart';
import 'package:complaintapp/project/controller/admin_controller.dart';
import 'package:complaintapp/project/customer/add_issue.dart/edit_issue.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/edit_complaint.dart';

class AdminComplaintCard extends StatelessWidget {
  AdminComplaintCard({
    Key? key,
    required this.id,
    required this.usertype,
  }) : super(key: key);

  final String id;
  final String usertype;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AdminController>(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    String address =
        '${provider.issues[id]!.state}, ${provider.issues[id]!.city}, ${provider.issues[id]!.area}, ${provider.issues[id]!.pincode}';
    // address = address.length < 30
    //     ? address
    //     : '${address.substring(0, address.length - (address.length - 35))}...';
    //--
    String date = provider.issues[id]!.datetime.toString().substring(0, 11);
    int hr =
        int.parse(provider.issues[id]!.datetime.toString().substring(11, 13));
    int min =
        int.parse(provider.issues[id]!.datetime.toString().substring(14, 16));
    int timeHr = hr == 0
        ? 12
        : hr > 12
            ? hr - 12
            : hr;
    String time = "$timeHr:$min ${hr < 12 ? 'am' : 'pm'}";
    //--
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ViewComplaint(id: id),
        ),
      ),
      child: SizedBox(//
        height: 200,
        width: w,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                height: 200,
                width: w - 16,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF270980),
                      offset: Offset(0, 0),
                      blurRadius: 0,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Color(0xFF270980),
                      offset: Offset(4, 5),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
              Container(
                height: 55,
                width: w - 16,
                decoration: const BoxDecoration(
                  color: Color(0xFF503da6),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(150.0),
                    bottomLeft: Radius.circular(200.0),
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                ),
              ),
              Container(
                height: 54,
                width: w - 16,
                decoration: const BoxDecoration(
                  color: Color(0xffcfe2e8),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(220.0),
                    bottomRight: Radius.circular(165),
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(45),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 95,
                  width: w / 4,
                  decoration: const BoxDecoration(
                    color: Color(0xFFbbb4db),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(200.0),
                      // topRight: Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
              //

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Text(
                            provider.issuesstatus[id]!.status,
                            style: const TextStyle(
                              color: Color(0xff050229),
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Color(0xFFbbb4db),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('$date $time'),
                          )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        "Type:  ${provider.issues[id]!.type}",
                        style: const TextStyle(
                          color: Color(0xff050229),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        "Category:  ${provider.issues[id]!.category}",
                        style: const TextStyle(
                          color: Color(0xff050229),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        "Title:  ${provider.issues[id]!.title}",
                        style: const TextStyle(
                          color: Color(0xff050229),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 10),
                      child: Container(
                        width: w-140,
                        child: Text(
                          "☛  $address",
                          style: const TextStyle(
                            color: Color(0xff050229),
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              //   child: Container(
              //     height: 80,
              //     decoration: const BoxDecoration(
              //       color: Color(0xFF614ac2),
              //       borderRadius: BorderRadius.all(Radius.circular(20.0)),
              //     ),
              //   ),
              // ),
              provider.cardbutton == id
                  ? Container(
                      height: 200,
                      width: w - 16,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                      ),
                    )
                  : const Text(''),

              ///----------CARD BUTTONS---
              Positioned(
                bottom: 5,
                right: 5,
                child: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: const Color(0xFF503da6),
                    child: Icon(
                        provider.cardbutton == id ? Icons.close : Icons.add),
                  ),
                  onTap: () => provider.changeCardButton(id),
                ),
              ),
              provider.cardbutton == id
                  ? Positioned(
                      bottom: 5,
                      right: w / 5.4,
                      child: GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, AddAdmin.routeName),
                        child: const CircleAvatar(
                          backgroundColor: Color(0xFF503da6),
                          child: Icon(Icons.add_circle_outline_outlined),
                        ),
                      ),
                    )
                  : const Text(''),
              provider.cardbutton == id
                  ? Positioned(
                      bottom: 50,
                      right: w / 7.5,
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminEditIssue(id: id),
                          ),
                        ),
                        child: const CircleAvatar(
                          backgroundColor: Color(0xFF503da6),
                          child: Icon(Icons.edit),
                        ),
                      ),
                    )
                  : const Text(''),
              provider.cardbutton == id
                  ? Positioned(
                      bottom: 73,
                      right: 5,
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => usertype == 'customer'
                                ? ViewComplaint(id: id)
                                : const AssignToOperator(),
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFF503da6),
                          child: Icon(usertype == 'customer'
                              ? Icons.view_in_ar_sharp
                              : Icons.person_add_alt),
                        ),
                      ),
                    )
                  : const Text(''),
            ],
          ),
        ),
      ),
    );
  }

  var boxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: const [
      BoxShadow(
        // color: Color(0xFFD7D8F5),
        color: Color(0xFFE0E0E0),
        offset: Offset(2.0, 2.0),
        blurRadius: 10.0,
        spreadRadius: 1.0,
      ),
      BoxShadow(
        // color: Color(0xFFB0B2F9),
        color: Color(0xFFE0E0E0),
        offset: Offset(2.0, 2.0),
        blurRadius: 10.0,
        spreadRadius: 2.0,
      )
    ],
  );
}

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:complaintapp/project/admin_and_operator/complaints/update_status.dart';
import 'package:complaintapp/project/constants/methods.dart';
import 'package:complaintapp/project/controller/admin_controller.dart';
import 'package:complaintapp/project/controller/edit_complaint_data.dart';
import 'package:complaintapp/project/controller/fetch_complaint_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'assign/assign_issue.dart';
import 'view/edit_complaint.dart';
import 'view/view_complaint.dart';

class AdminComplaintCard extends StatelessWidget {
  AdminComplaintCard({
    Key? key,
    required this.id,
    required this.usertype,
  }) : super(key: key);

  final String id;
  final String usertype;
  //
  @override
  Widget build(BuildContext context) {
    var adminProvider = Provider.of<AdminController>(context);
    var ecProvider = Provider.of<EditComplaintProvider>(context);
    var fcProvider = Provider.of<FetchComplaintProvider>(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    String address =
        '${fcProvider.issues[id]!.state}, ${fcProvider.issues[id]!.city}, ${fcProvider.issues[id]!.area}, ${fcProvider.issues[id]!.pincode}';
    // address = address.length < 30
    //     ? address
    //     : '${address.substring(0, address.length - (address.length - 35))}...';
    //--
    String date =
        fcProvider.issues[id]!.datetime.toString().substring(0, 11);
    int hr = int.parse(
        fcProvider.issues[id]!.datetime.toString().substring(11, 13));
    int min = int.parse(
        fcProvider.issues[id]!.datetime.toString().substring(14, 16));
    String time = timeFormat(hr, min);
    //--
    return GestureDetector(
      onTap: () => adminProvider.cardbutton == id
          ? const Text('')
          : Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViewComplaint(id: id),
              ),
            ),
      child: SizedBox(
        //
        height: 200,
        width: w,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                height: 200,
                width: w - 16,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.0),
                      offset: const Offset(0, 0),
                      blurRadius: 0,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: const Offset(4, 5),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
              Container(
                height: 55,
                width: w - 16,
                decoration: BoxDecoration(
                  color: const Color(0xFF503da6).withOpacity(0.3),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(150.0),
                    bottomLeft: Radius.circular(200.0),
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF503da6).withOpacity(0.0),
                      offset: const Offset(0, 0),
                      blurRadius: 0,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: const Color(0xFF503da6).withOpacity(0.3),
                      offset: const Offset(4, 5),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
              Container(
                height: 54,
                width: w - 16,
                decoration: BoxDecoration(
                  color: const Color(0xffcfe2e8).withOpacity(0.3),
                  borderRadius: const BorderRadius.only(
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
                  decoration: BoxDecoration(
                    color: const Color(0xFFbbb4db).withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(200.0),
                      // topRight: Radius.circular(10.0),
                    ),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: const Color(0xFF503da6).withOpacity(0.0),
                    //     offset: const Offset(0, 0),
                    //     blurRadius: 0,
                    //     spreadRadius: 1,
                    //   ),
                    //   BoxShadow(
                    //     color: const Color(0xFF503da6).withOpacity(0.3),
                    //     offset: const Offset(4, 5),
                    //     blurRadius: 8,
                    //     spreadRadius: 1,
                    //   ),
                    // ],
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
                            fcProvider.issuesstatus[id]!.status,
                            style: const TextStyle(
                              // color: Color(0xff050229),
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFbbb4db).withOpacity(0.5),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0)),
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
                        "Type:  ${fcProvider.issues[id]!.type}",
                        style: const TextStyle(
                          // color: Color(0xff050229),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        "Category:  ${fcProvider.issues[id]!.category}",
                        style: const TextStyle(
                          // color: Color(0xff050229),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        "Title:  ${fcProvider.issues[id]!.title}",
                        style: const TextStyle(
                          // color: Color(0xff050229),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 10),
                      child: SizedBox(
                        width: w - 140,
                        child: Text(
                          "☛  $address",
                          style: const TextStyle(
                            // color: Color(0xff050229),
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
              adminProvider.cardbutton == id
                  ? Container(
                      height: 200,
                      width: w - 16,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
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
                    child: Icon(adminProvider.cardbutton == id
                        ? Icons.close
                        : Icons.add),
                  ),
                  onTap: () => adminProvider.changeCardButton(id),
                ),
              ),
              adminProvider.cardbutton == id
                  ? Positioned(
                      bottom: 5,
                      right: w / 5.4,
                      child: GestureDetector(
                        onTap: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Column(
                                children: [
                                  ListTile(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ViewComplaint(id: id),
                                      ),
                                    ),
                                    title: const Text("View Status"),
                                    trailing: const Icon(Icons.pending_actions),
                                  ),
                                  ListTile(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UpdateStatus(id: id),
                                      ),
                                    ),
                                    title: const Text("Update status"),
                                    trailing: const Icon(Icons.update),
                                  ),
                                  ListTile(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AdminEditIssue(id: id),
                                      ),
                                    ),
                                    title: const Text("Edit"),
                                    trailing: const Icon(Icons.edit),
                                  ),
                                  ListTile(
                                    onTap: () => AwesomeDialog(
                                      context: context,
                                      animType: AnimType.SCALE,
                                      dialogType: DialogType.WARNING,
                                      body: Center(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: const [
                                            Text(
                                              'Delete!',
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              'Are you sure to delete this complaint!',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                      btnCancelOnPress: () {},
                                      btnCancelText: 'NO',
                                      btnOkOnPress: () {
                                        ecProvider.deleteComplaint(id);
                                        Navigator.pop(context);
                                      },
                                      btnOkText: 'YES',
                                    ).show(),
                                    title: const Text("Delete"),
                                    trailing: const Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: const CircleAvatar(
                          backgroundColor: Color(0xFF503da6),
                          child: Icon(Icons.add_circle_outline_outlined),
                        ),
                      ),
                    )
                  : const Text(''),
              adminProvider.cardbutton == id
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
              adminProvider.cardbutton == id
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

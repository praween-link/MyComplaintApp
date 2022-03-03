import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complaintapp/project/admin_and_operator/admin/viewuser/admin/admins_list_view_builder.dart';
import 'package:complaintapp/project/models/admin.dart';
import 'package:flutter/material.dart';
import 'package:complaintapp/project/models/status.dart';

class AdminController extends ChangeNotifier {
  Map<String, Admin> adminsData = {};
  List<String> adminPhoneNo = [];
  String status = 'Hello Status';

//
  //
  String cardbutton = '';
  bool cardb = false;
  void changeCardButton(String id) {
    cardb = !cardb;
    cardbutton = cardb ? id : '';
    notifyListeners();
  }
  //

  //---------Admin User------------

  final _firestore = FirebaseFirestore.instance;
  void addNewAdmin(Admin admin) {
    _firestore.collection('Admin').doc('users').set({}).then((value) {
      // print();
      _firestore.collection("Admin").doc('users').collection("Users").add({
        "name": admin.name,
        "phone": admin.phone,
        "email": admin.email,
        "password": admin.password,
        "address": admin.address,
        "photo": admin.photo,
      });
    });
    notifyListeners();
  }

  //
  void addAdminToMap(String id, Admin admin, String phone) {
    adminsData.addAll({id: admin});
    adminPhoneNo.add(phone);
    notifyListeners();
  }

  getAllAdminFromDB() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Admin')
          .doc('users')
          .collection('Users')
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!.docs;
          adminsData = {};
          adminPhoneNo = [];
          return AdminsListViewBuilder(data: data);
        } else if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  //-------------------------------------
  updateStatus(String id, ComplaintStatus cs) {
    return FirebaseFirestore.instance
        .collection('CustomerIssues')
        .doc(id)
        .update({
      'status': cs.status,
      'processStatus': cs.processStatus,
      'currentStatus': cs.currentStatus,
      'dates': cs.dates,
    });
  }
}

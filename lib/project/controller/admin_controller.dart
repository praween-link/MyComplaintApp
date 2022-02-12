import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complaintapp/project/admin_and_operator/admin/admin_home.dart';
import 'package:complaintapp/project/admin_and_operator/admin/admin_complaint_card.dart';
import 'package:complaintapp/project/admin_and_operator/admin/viewuser/admin/admins_list_view_builder.dart';
import 'package:complaintapp/project/admin_and_operator/admin/viewuser/operator/operator_view_card.dart';
import 'package:complaintapp/project/admin_and_operator/admin/viewuser/operator/operators_list_view_builder.dart';
import 'package:complaintapp/project/customer/home/home_screen/service_card.dart';
import 'package:complaintapp/project/models/admin.dart';
import 'package:complaintapp/project/models/issue.dart';
import 'package:complaintapp/project/models/operator.dart';
import 'package:flutter/material.dart';
import 'package:complaintapp/project/models/status.dart';

class AdminController extends ChangeNotifier {
  Map<String, Issue> issues = {};
  Map<String, ComplaintStatus> issuesstatus = {};
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

  int count = 0;
  AdminIssuesListDataWidget() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('CustomerIssues')
          .orderBy('date', descending: true)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!.docs;
          issues = {};
          issuesstatus = {};
          count = data.length;
          return ListView.builder(
              // reverse: true,
              itemCount: data.length + 2, //3
              itemBuilder: (BuildContext context, int index) {
                if (index >= 2) {
                  //-----
                  Map<String, bool> boolmap = {
                    "recorded": data[index - 2]['processStatus']['recorded'],
                    "assigned": data[index - 2]['processStatus']['assigned'],
                    "traveling": data[index - 2]['processStatus']['traveling'],
                    "done": data[index - 2]['processStatus']['done']
                  };
                  Map<String, String> datemap = {
                    "recorded": data[index - 2]['dates']['recorded'],
                    "assigned": data[index - 2]['dates']['assigned'],
                    "traveling": data[index - 2]['dates']['traveling'],
                    "done": data[index - 2]['dates']['done']
                  };
                  Issue issue = Issue(
                      type: data[index - 2]['type'],
                      title: data[index - 2]['title'],
                      category: data[index - 2]['category'],
                      description: data[index - 2]['description'],
                      datetime: data[index - 2]['date'],
                      name: data[index - 2]['address']['name'],
                      phone: data[index - 2]['address']['phone'],
                      email: data[index - 2]['address']['email'],
                      pincode: data[index - 2]['address']['pincode'],
                      state: data[index - 2]['address']['state'],
                      city: data[index - 2]['address']['city'],
                      area: data[index - 2]['address']['area'],
                      locationtype: data[index - 2]['address']['addresstype']);
                  issues.addAll({data[index - 2].id: issue});
                  ComplaintStatus cs = ComplaintStatus(
                      status: data[index - 2]['status'],
                      processStatus: boolmap,
                      currentStatus: data[index - 2]['currentStatus'],
                      dates: datemap);
                  issuesstatus.addAll({data[index - 2].id: cs});
                  //-----
                }
                return index == 0
                    ? const SizedBox(
                        height: 218,
                      )
                    : index == 1
                        ? const MyAllComplaintInCount()
                        // : adminComplaintCard(id: data[index - 2].id, usertype: 'admin');
                        : AdminComplaintCard(
                            id: data[index - 2].id,
                            usertype: 'admin',
                          );
              });
        } else if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

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
            return AdminsListViewBuilder(data: data);
          } else if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void addNewOperator(Operator operator) {
    _firestore.collection('Operator').doc('users').set({}).then((value) {
      // print();
      _firestore.collection("Operator").doc('users').collection("Users").add({
        "name": operator.name,
        "phone": operator.phone,
        "email": operator.email,
        "password": operator.password,
        "address": operator.address,
        "photo": operator.photo,
        "category": operator.category,
      });
    });
    notifyListeners(); 
  }
  getAllOperatorFromDB() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Operator')
            .doc('users')
            .collection('Users')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!.docs;
            return OperatorsListViewBuilder(data: data);
          } else if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  //---------COMPLAINT TYPES------------
  void addCompalaintTypeToDB(String type) {
    _firestore.collection('Admin').doc('complainttype').set({}).then((value) {
      // print();
      _firestore
          .collection("Admin")
          .doc('complainttype')
          .collection("ComplaintType")
          .add({"type": type});
    });
    notifyListeners();
  }

  getComplaintTypesFromDB() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Admin')
            .doc('complainttype')
            .collection('ComplaintType')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!.docs;
            return GridView.builder(
                itemCount: data.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  // childAspectRatio: 3 / 2,
                  // crossAxisSpacing: 20,
                  // mainAxisSpacing: 20,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ServiceCard(
                        usertype: 'admin',
                        id: data[index].id,
                        title: data[index]['type']),
                  );
                });
          } else if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  deleteComplaintTypesFromDB(String id) {
    return FirebaseFirestore.instance
        .collection('Admin')
        .doc('complainttype')
        .collection('ComplaintType')
        .doc(id)
        .delete();
  }

  deleteComplaint(String id) {
    return FirebaseFirestore.instance
        .collection('CustomerIssues')
        .doc(id)
        .delete();
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complaintapp/project/customer/customer_all_complaint_count.dart';
import 'package:complaintapp/project/customer/customer_complaint_card.dart';
import 'package:complaintapp/project/customer/home/home_screen/grid_view_builder.dart';
import 'package:complaintapp/project/customer/home/home_screen/service_card.dart';
import 'package:complaintapp/project/models/issue.dart';
import 'package:flutter/material.dart';
import 'package:complaintapp/project/models/status.dart';

class CustomerController extends ChangeNotifier {
  var mytitle = '';
  Map<String, Issue> issues = {};
  Map<String, ComplaintStatus> issuesstatus = {};
  List<String> ll = [];
  List<String> complaintTypes = [];
  final _firestore = FirebaseFirestore.instance;

  //
  String cardbutton = '';
  bool cardb = false;
  void changeCardButton(String id) {
    cardb = !cardb;
    cardbutton = cardb ? id : '';
    notifyListeners();
  }
  //
  //------------------------

  void addIssueToDB(Issue issue, ComplaintStatus cs) {
    _firestore.collection('CustomerIssues').add({
      'type': issue.type,
      'title': issue.title,
      'category': issue.category,
      'description': issue.description,
      'date': issue.datetime,
      'address': {
        'name': issue.name,
        'phone': issue.phone,
        'email': issue.email,
        'pincode': issue.pincode,
        'state': issue.state,
        'city': issue.city,
        'area': issue.area,
        'addresstype': issue.locationtype
      },
      "status": cs.status,
      "processStatus": cs.processStatus,
      "currentStatus": cs.currentStatus,
      "dates": cs.dates,
    }).then((value) {
      print(value.id);
    });
    notifyListeners();
  }

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

  //Update
  void UpdateIssueToDB(Issue issue, String id) {
    _firestore.collection('CustomerIssues').doc(id).update({
      'title': issue.title,
      'category': issue.category,
      'description': issue.description,
      'address': {
        'name': issue.name,
        'phone': issue.phone,
        'email': issue.email,
        'pincode': issue.pincode,
        'state': issue.state,
        'city': issue.city,
        'area': issue.area,
        'addresstype': issue.locationtype
      },
    }).then((value) {});
    notifyListeners();
  }

  // void getIssuesFromDB() async {
  //   await for (var snapshot
  //       in _firestore.collection('CustomerIssues').snapshots()) {
  //     List<Issue> list = [];
  //     for (var data in snapshot.docs) {
  //       ll.add(data.data()['description']);
  //     }
  //     issues.addAll(list);
  //     notifyListeners();
  //   }
  // }

  void setTssues(List<String> l) {
    ll = l;
    notifyListeners();
  }

  // getIssues() => _issues;
  //-----------------------------------------------------
  int count = 0;
  String status = '';
  CustomerIssuesListDataWidget(String emailid) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('CustomerIssues')
          .where('address.email', isEqualTo: emailid)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!.docs;
          issues = {};
          issuesstatus = {};
          return ListView.builder(
              itemCount: data.length + 1,
              itemBuilder: (BuildContext context, int index) {
                // count++;
                // status = data[index-1]['status'];
                if (index != 0) {
                  //-----
                  Map<String, bool> boolmap = {
                    "recorded": data[index - 1]['processStatus']['recorded'],
                    "assigned": data[index - 1]['processStatus']['assigned'],
                    "traveling": data[index - 1]['processStatus']['traveling'],
                    "done": data[index - 1]['processStatus']['done']
                  };
                  Map<String, String> datemap = {
                    "recorded": data[index - 1]['dates']['recorded'],
                    "assigned": data[index - 1]['dates']['assigned'],
                    "traveling": data[index - 1]['dates']['traveling'],
                    "done": data[index - 1]['dates']['done']
                  };
                  Issue issue = Issue(
                      type: data[index - 1]['type'],
                      title: data[index - 1]['title'],
                      category: data[index - 1]['category'],
                      description: data[index - 1]['description'],
                      datetime: data[index - 1]['date'],
                      name: data[index - 1]['address']['name'],
                      phone: data[index - 1]['address']['phone'],
                      email: data[index - 1]['address']['email'],
                      pincode: data[index - 1]['address']['pincode'],
                      state: data[index - 1]['address']['state'],
                      city: data[index - 1]['address']['city'],
                      area: data[index - 1]['address']['area'],
                      locationtype: data[index - 1]['address']['addresstype']);
                  issues.addAll({data[index - 1].id: issue});
                  ComplaintStatus cs = ComplaintStatus(
                      status: data[index - 1]['status'],
                      processStatus: boolmap,
                      currentStatus: data[index - 1]['currentStatus'],
                      dates: datemap);
                  issuesstatus.addAll({data[index - 1].id: cs});
                  //-----
                }

                return index == 0
                    ? const MyAllComplaintInCount()
                    : CustomerComplaintCard(
                        id: data[index - 1].id, usertype: 'customer');
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

  getGridViewComplaintTypesCustomer() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Admin')
            .doc('complainttype')
            .collection('ComplaintType')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!.docs;
            return CustomerGridViewBuilderComplaintTypes(data: data);
          } else if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}

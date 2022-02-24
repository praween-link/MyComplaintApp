// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:complaintapp/project/modle/status.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complaintapp/project/admin_and_operator/admin/viewuser/operator/operators_list_view_builder.dart';
import 'package:complaintapp/project/models/operator.dart';
import 'package:flutter/material.dart';

class OperatorController extends ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;

  Map<String, Operator> operatorsData = {};
  List<String> operatorsPhoneNo = [];

  //
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

  void addOperatorToMap(String id, Operator operator, String phone) {
    operatorsData.addAll({id: operator});
    operatorsPhoneNo.add(phone);
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
            operatorsData = {};
            operatorsPhoneNo = [];
            return OperatorsListViewBuilder(data: data);
          } else if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class LoginController extends ChangeNotifier {
  List<String> operatorsPhones = [];
  List<String> adminPhones = [];
  Map<String, String> operatorPass = {};
  Map<String, String> adminPass = {};

  void getphoneno() async {
    operatorsPhones = [];
    operatorPass = {};
    await for (var snapshot in FirebaseFirestore.instance
        .collection('Operator')
        .doc('users')
        .collection('Users')
        .snapshots()) {
      for (var data in snapshot.docs) {
        operatorsPhones.add(data.data()['phone']);
        operatorPass.addAll({data.data()['phone']: data.data()['password']});
        notifyListeners();
      }
    }
  }

  void getadminphoneno() async {
    adminPhones = [];
    adminPass = {};
    await for (var snapshot in FirebaseFirestore.instance
        .collection('Admin')
        .doc('users')
        .collection('Users')
        .snapshots()) {
      for (var data in snapshot.docs) {
        adminPhones.add(data.data()['phone']);
        adminPass.addAll({data.data()['phone']: data.data()['password']});
        notifyListeners();
      }
    }
  }
}

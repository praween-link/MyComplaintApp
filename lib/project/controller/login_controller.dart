import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complaintapp/project/models/admin.dart';
import 'package:complaintapp/project/models/operator.dart';
import 'package:flutter/cupertino.dart';

class LoginController extends ChangeNotifier {
  List<String> operatorsPhones = [];
  List<String> adminPhones = [];
  Map<String, dynamic> operatorPass = {};
  Map<String, dynamic> adminPass = {};

  void getphoneno() async {
    operatorsPhones = [];
    operatorPass = {};
    await for (var snapshot in FirebaseFirestore.instance
        .collection('Operator')
        .doc('users')
        .collection('Users')
        .snapshots()) {
      for (var data in snapshot.docs) {
        OperatorAddress op = OperatorAddress(
          pincode: data.data()['address']['pincode'],
          state: data.data()['address']['state'],
          city: data.data()['address']['city'],
          area: data.data()['address']['area'],
        );
        Operator operator = Operator(
          name: data.data()['name'],
          phone: data.data()['phone'],
          password: data.data()['password'],
          email: data.data()['email'],
          address: op,
          photo: data.data()['photo'],
          category: data.data()['category'],
        );
        operatorsPhones.add(data.data()['phone']);
        operatorPass.addAll({
          data.data()['phone']: data.data()['password'],
          "${data.data()['phone']}id": data.id,
          "${data.data()['phone']}data": operator
        });
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
        AdminAddress ad = AdminAddress(
          pincode: data.data()['address']['pincode'],
          state: data.data()['address']['state'],
          city: data.data()['address']['city'],
          area: data.data()['address']['area'],
        );
        Admin admin = Admin(
          name: data.data()['name'],
          phone: data.data()['phone'],
          password: data.data()['password'],
          email: data.data()['email'],
          address: ad,
          photo: data.data()['photo'],
        );
        adminPhones.add(data.data()['phone']);
        adminPass.addAll({
          data.data()['phone']: data.data()['password'],
          "${data.data()['phone']}id": data.id,
          "${data.data()['phone']}data": admin
        });
        notifyListeners();
      }
    }
  }
}

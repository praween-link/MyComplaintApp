import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complaintapp/project/admin_and_operator/admin/viewuser/operator/operator_view_card.dart';
import 'package:complaintapp/project/models/operator.dart';
import 'package:flutter/material.dart';

class OperatorsListViewBuilder extends StatelessWidget {
  const OperatorsListViewBuilder({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<QueryDocumentSnapshot<Object?>> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          Operator operator = Operator(
              name: data[index]['name'],
              phone: data[index]['phone'],
              password: data[index]['password'],
              email: data[index]['email'],
              address: {
                'pincode': data[index]['address']['pincode'],
                'state': data[index]['address']['state'],
                'city': data[index]['address']['city'],
                'area': data[index]['address']['area']
              },
              photo: data[index]['photo'], category: data[index]['category']);
          return OperatorViewCard(data: operator);
        });
  }
}
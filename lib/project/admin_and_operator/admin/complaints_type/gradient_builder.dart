import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complaintapp/project/customer/home/home_screen/service_card.dart';
import 'package:flutter/material.dart';

class GradientBuilder extends StatelessWidget {
  const GradientBuilder({Key? key, required this.data}) : super(key: key);
  final List<QueryDocumentSnapshot<Object?>> data;

  @override
  Widget build(BuildContext context) {
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
      },
    );
  }
}

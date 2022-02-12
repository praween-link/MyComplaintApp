import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'service_card.dart';

class CustomerGridViewBuilderComplaintTypes extends StatelessWidget {
  const CustomerGridViewBuilderComplaintTypes({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<QueryDocumentSnapshot<Object?>> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 58.0),
      child: GridView.builder(
          itemCount: data.length + 2,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            // childAspectRatio: 3 / 1,
            // crossAxisSpacing: 20,
            // mainAxisSpacing: 20,
          ),
          itemBuilder: (BuildContext context, int index) {
            return index == 0 || index == 1
                ? const Text('')
                : Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ServiceCard(
                        usertype: 'customer',
                        id: data[index - 2].id,
                        title: data[index - 2]['type']),
                  );
          }),
    );
  }
}

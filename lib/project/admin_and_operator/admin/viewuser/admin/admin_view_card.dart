import 'package:complaintapp/project/models/admin.dart';
import 'package:flutter/material.dart';

class AdminViewCard extends StatelessWidget {
  const AdminViewCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Admin data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 0),
              blurRadius: 0,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(4, 5),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ListTile(
          leading: const CircleAvatar(
            backgroundColor: Color(0xFF755fcf),
            radius: 28,
            child: CircleAvatar(
              radius: 27,
              backgroundImage: AssetImage(
                'assets/img/profile/p1.png',
              ),
            ),
          ),
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(data.name),
            ],),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                Text(data.phone),
                const Divider(),
                Text(data.email),
                const Divider(),
                Text(
                    '${data.address.state}, ${data.address.city}, ${data.address.area}, ${data.address.pincode}'),
                const Divider(),
                Text('*** ${data.password}'),
              ],
            )),
        ),
    );
  }
}

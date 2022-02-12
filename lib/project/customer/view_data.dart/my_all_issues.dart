import 'package:complaintapp/project/controller/customer_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
FirebaseAuth _auth = FirebaseAuth.instance;

class ViewMyIssues extends StatelessWidget {
  static const routeName = '/viewAllIssues';
  const ViewMyIssues({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var customerController = Provider.of<CustomerController>(context);
    // provider.getIssuesFromDB();

    var issues = customerController.ll.toSet().toList();
    // provider.setTssues(issues);
    return Scaffold(
      appBar: AppBar(
        title: const Text('View'),
        actions: const[
          Padding(
            padding: EdgeInsets.only(right: 22.0, left: 12.0, top: 12.0, bottom: 12.0),
            child: Text('5', style: TextStyle(fontSize: 25),),
          ),
        ],
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.chevron_left,
            size: 35,
          ),
        ),
      ),
      body: customerController.CustomerIssuesListDataWidget(_auth.currentUser!.email.toString()),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complaintapp/project/admin_and_operator/admin/complaints_type/gradient_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditComplaintProvider extends ChangeNotifier {
  
  //---------------ADMIN-----------------//
  final _firestore = FirebaseFirestore.instance;
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
            return GradientBuilder(data: data);
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
  //---------------OPERATOR-----------------//
}
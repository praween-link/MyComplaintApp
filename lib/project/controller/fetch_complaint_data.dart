import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complaintapp/project/admin_and_operator/complaints/complaint_card.dart';
import 'package:complaintapp/project/admin_and_operator/home/status_row_part/status_row.dart';
import 'package:complaintapp/project/models/issue.dart';
import 'package:complaintapp/project/models/status.dart';
import 'package:flutter/material.dart';

class FetchComplaintProvider extends ChangeNotifier {
  //---------------ADMIN-----------------//
  Map<String, Issue> issues = {};
  Map<String, ComplaintStatus> issuesstatus = {};
  int count = 0;

  AdminIssuesListDataWidget() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('CustomerIssues')
          .orderBy('date', descending: true)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!.docs;
          issues = {};
          issuesstatus = {};
          count = data.length;
          return ListView.builder(
              // reverse: true,
              itemCount: data.length + 2, //3
              itemBuilder: (BuildContext context, int index) {
                if (index >= 2) {
                  //-----
                  Map<String, bool> boolmap = {
                    "recorded": data[index - 2]['processStatus']['recorded'],
                    "assigned": data[index - 2]['processStatus']['assigned'],
                    "traveling": data[index - 2]['processStatus']['traveling'],
                    "done": data[index - 2]['processStatus']['done']
                  };
                  Map<String, String> datemap = {
                    "recorded": data[index - 2]['dates']['recorded'],
                    "assigned": data[index - 2]['dates']['assigned'],
                    "traveling": data[index - 2]['dates']['traveling'],
                    "done": data[index - 2]['dates']['done']
                  };
                  Issue issue = Issue(
                      type: data[index - 2]['type'],
                      title: data[index - 2]['title'],
                      category: data[index - 2]['category'],
                      description: data[index - 2]['description'],
                      datetime: data[index - 2]['date'],
                      name: data[index - 2]['address']['name'],
                      phone: data[index - 2]['address']['phone'],
                      email: data[index - 2]['address']['email'],
                      pincode: data[index - 2]['address']['pincode'],
                      state: data[index - 2]['address']['state'],
                      city: data[index - 2]['address']['city'],
                      area: data[index - 2]['address']['area'],
                      locationtype: data[index - 2]['address']['addresstype']);
                  issues.addAll({data[index - 2].id: issue});
                  ComplaintStatus cs = ComplaintStatus(
                      status: data[index - 2]['status'],
                      processStatus: boolmap,
                      currentStatus: data[index - 2]['currentStatus'],
                      dates: datemap);
                  issuesstatus.addAll({data[index - 2].id: cs});
                  //-----
                }
                return index == 0
                    ? const SizedBox(
                        height: 218,
                      )
                    : index == 1
                        ? const MyAllComplaintInCount()
                        // : adminComplaintCard(id: data[index - 2].id, usertype: 'admin');
                        : AdminComplaintCard(
                            id: data[index - 2].id,
                            usertype: 'admin',
                          );
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

  //---------------OPERATOR-----------------//
}

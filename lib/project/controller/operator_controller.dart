// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:complaintapp/project/modle/status.dart';

// class OperatorController extends ChangeNotifier {
//   final _firestore = FirebaseFirestore.instance;
//   //Update
//   void UpdateStatus(ComplaintStatus cs, String id) {
//     _firestore.collection('CustomerIssues').doc(id).update({
//       'status': cs.status,
//       'currentStatus': cs.currentStatus,
//       'processStatus': {
//         "recorded": cs.processStatus['recorded'],
//         "assigned": cs.processStatus['assigned'],
//         "traveling": cs.processStatus['traveling'],
//         "done": cs.processStatus['done']
//       },
//       'dates': {
//         "recorded": cs.dates['recorded'],
//         "assigned": cs.dates['assigned'],
//         "traveling": cs.dates['traveling'],
//         "done": cs.dates['done']
//       }
//     }).then((value) {});
//     notifyListeners();
//   }
// }

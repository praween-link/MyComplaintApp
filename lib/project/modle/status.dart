import 'package:cloud_firestore/cloud_firestore.dart';

class ComplaintStatus {
  final String status;
  final Map<String, bool> processStatus;
  final String currentStatus;
  final Map<String, String> dates;
  const ComplaintStatus(
      {required this.status,
      required this.processStatus,
      required this.currentStatus,
      required this.dates});

  static fromFirestore(QueryDocumentSnapshot<Map<String, dynamic>> doc) {}
}
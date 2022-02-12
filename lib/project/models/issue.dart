import 'package:cloud_firestore/cloud_firestore.dart';

class Issue {
  final String type;
  final String title;
  final String category;
  final String description;
  final String datetime;
  final String name;
  final String phone;
  final String email;
  final String pincode;
  final String state;
  final String city;
  final String area;
  final String locationtype;
  // Map<String, bool> processStatus = {"recorded": false,
  //       "assigned": false,
  //       "traveling": false,
  //       "done": false};
  // Map<String, String> dates = {
  //   "recorded": '',
  //   "assigned": '',
  //   "traveling": '',
  //   "done": ''
  // };
  const Issue(
      {required this.type,
      required this.title,
      required this.category,
      required this.description,
      required this.datetime,
      required this.name,
      required this.phone,
      required this.email,
      required this.pincode,
      required this.state,
      required this.city,
      required this.area,
      required this.locationtype});

  static fromFirestore(QueryDocumentSnapshot<Map<String, dynamic>> doc) {}
}

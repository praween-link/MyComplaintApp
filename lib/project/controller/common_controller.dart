import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonController extends ChangeNotifier {
  //------Login-----------
  bool isAdmin = false;
  void changeLoginUserType(bool b) {
    isAdmin = b;
    notifyListeners();
  }

  //----------------------
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String user = '';
  Future<void> setUser(String u) async {
    SharedPreferences pf = await _prefs;
    pf.setString('currentuser', u).then((value) => null);
  }

  // Future<void> _getUser() async {
  //   SharedPreferences pf = await _prefs;
  //   user = pf.getString('currentuser') ?? '';
  // }

  // String getUser() {
  //   getUser();
  //   return user;
  // }

  // getStringValuesSF() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   //Return String
  //   String? stringValue = prefs.getString('currentuser');
  //   return stringValue;
  // }

  // fd() {
  //   return FutureBuilder<dynamic>(
  //       future: getStringValuesSF(),
  //       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
  //         switch (snapshot.connectionState) {
  //           case ConnectionState.waiting:
  //             return const CircularProgressIndicator();
  //           default:
  //             if (snapshot.hasError) {
  //               return Text('Error: ${snapshot.error}');
  //             } else {
  //               return Text(
  //                 'Button tapped ${snapshot.data}',
  //               );
  //             }
  //         }
  //       });
  // }
}

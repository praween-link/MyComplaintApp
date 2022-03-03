import 'package:complaintapp/project/admin_and_operator/operator/operator_drawer.dart';
import 'package:complaintapp/project/controller/common_controller.dart';
import 'package:complaintapp/project/controller/fetch_complaint_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'admin/admin_drawer.dart';
import 'home/top_ui_part/bottom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/adminHomeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var commonProvider = Provider.of<CommonController>(context);
    var fetchComplaintProvider = Provider.of<FetchComplaintProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home-> ${fetchComplaintProvider.count}|${fetchComplaintProvider.issues.length}'),
        backgroundColor: const Color(0xFF614ac2),
        elevation: 15,
        leading: Builder(
          builder: (BuildContext context) => GestureDetector(
            child: Image.asset('assets/img/menu_icon.png'),
            onTap: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      // backgroundColor: Colors.blueGrey[200],
      body: Stack(
        children: [
          fetchComplaintProvider.AdminIssuesListDataWidget(),
          // ListView.builder(
          //     itemCount: 3,
          //     itemBuilder: (context, int index) {
          //       return index == 0
          //           ? const SizedBox(
          //               height: 218,
          //             )
          //           : index == 1
          //               ? const MyAllComplaintInCount()
          //               : const Text("Hello");
          //       // : Expanded(child: provider.AdminIssuesListDataWidget());
          //     }),
          //
          //
          const topUiBottomAppBar(),
          //
        ],
      ),
      drawer: commonProvider.logined=='admin' ? const AdminDrawer() : const OperatorDrawer(),
    );
  }
}
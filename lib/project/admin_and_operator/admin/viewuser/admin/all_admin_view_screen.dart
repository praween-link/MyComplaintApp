import 'package:complaintapp/project/controller/admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllAdminViewScreen extends StatelessWidget {
  const AllAdminViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var adminController = Provider.of<AdminController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Admins'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.chevron_left,
            size: 35,
          ),
        ),
      ),
      body: Container(
        child: adminController.getAllAdminFromDB(),
      ),
    );
  }
}

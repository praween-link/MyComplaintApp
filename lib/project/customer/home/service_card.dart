import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:complaintapp/project/constants/decorations.dart';
import 'package:complaintapp/project/controller/admin_controller.dart';
import 'package:complaintapp/project/controller/customer_controller.dart';
import 'package:complaintapp/project/customer/add_issue.dart/add_issue.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    Key? key,
    required this.usertype,
    required this.id,
    required this.title,
  }) : super(key: key);

  final String usertype;
  final String id;
  final String title;

  @override
  Widget build(BuildContext context) {
    var adminProvider = Provider.of<AdminController>(context);
    var customerProvider = Provider.of<CustomerController>(context);
    String logolink = 'assets/img/1.png';
    return GestureDetector(
      onLongPress: () => usertype == 'admin'
          ? AwesomeDialog(
              context: context,
              animType: AnimType.SCALE,
              dialogType: DialogType.WARNING,
              body: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Delete!',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Are you sure to delete $title service!',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              btnCancelOnPress: () {},
              btnCancelText: 'NO',
              btnOkOnPress: () => adminProvider.deleteComplaintTypesFromDB(id),
              btnOkText: 'YES',
            ).show()
          : Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddIssue(type: title))),
      onTap: () => usertype == 'admin'
          ? const Text('')
          : Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddIssue(type: title))),
      child: Container(
        width: 140,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(logolink),
                height: 60,
                width: 60,
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Servies",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        decoration: serviceBoxDecoration,
      ),
    );
  }
}

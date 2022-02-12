import 'package:complaintapp/project/admin_and_operator/admin/adduser/add_admin.dart';
import 'package:complaintapp/project/admin_and_operator/admin/adduser/add_operator.dart';
import 'package:complaintapp/project/admin_and_operator/admin/admin_home.dart';
import 'package:complaintapp/project/admin_and_operator/admin/profile/admin_profile.dart';
import 'package:complaintapp/project/admin_and_operator/admin/viewuser/admin/all_admin_view_screen.dart';
import 'package:complaintapp/project/welcome_scr/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'complaints_type/add_complaints_type.dart';
import 'viewuser/operator/all_operator_view_screen.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: FadeInImage(
              image: const NetworkImage("https://www.awn.com/sites/default/files/styles/inline_wide/public/image/featured/1040167-original-songs-mexican-sounds-set-pixars-coco-soundtrack.jpg?itok=fCz310bu"),
              placeholder: const AssetImage("assets/img/google.png"),
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/images/1.png',
                    fit: BoxFit.cover);
              },
              fit: BoxFit.cover,
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              // image: DecorationImage(
              //   image: NetworkImage(
              //       'https://www.awn.com/sites/default/files/styles/inline_wide/public/image/featured/1040167-original-songs-mexican-sounds-set-pixars-coco-soundtrack.jpg?itok=fCz310bu'),
              //   fit: BoxFit.cover,
              // ),
            ),
            // child: Text(''),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () =>
                Navigator.pushNamed(context, AdminHomeScreen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile'),
            onTap: () => Navigator.pushNamed(context, AdminProfile.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.add_to_photos_rounded),
            title: const Text('Add Admin'),
            onTap: () => Navigator.pushNamed(context, AddAdmin.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.add_to_photos_rounded),
            title: const Text('Add Operator'),
            onTap: () => Navigator.pushNamed(context, AddOperator.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Customer Decoration'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddComplaintType())),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Admins'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const AllAdminViewScreen())),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Operators'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const AlloperatorsViewScreen())),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Logout'),
            onTap: () => Navigator.pushNamed(context, Welcome.routeName),
          ),
        ],
      ),
    );
  }
}

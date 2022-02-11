import 'package:complaintapp/project/controller/customer_controller.dart';
import 'package:complaintapp/project/customer/home/customer_home.dart';
import 'package:complaintapp/project/customer/home/profile/customer_profile.dart';
import 'package:complaintapp/project/customer/login/google/auth.dart';
import 'package:complaintapp/project/welcome_scr/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view_data.dart/my_all_issues.dart';
GoogleFirebaseAuth googleAuth = GoogleFirebaseAuth();
FirebaseAuth _auth = FirebaseAuth.instance;

class CustomerDrawer extends StatelessWidget {
  const CustomerDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var customerProvider = Provider.of<CustomerController>(context, listen: false);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
         DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
              // image: DecorationImage(
              //   image: NetworkImage(
              //       'https://png.pngtree.com/thumb_back/fh260/background/20200714/pngtree-modern-double-color-futuristic-neon-background-image_351866.jpg'),
              //   fit: BoxFit.cover,
              // ),
            ),
            child: Text(_auth.currentUser!.email.toString()),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => Navigator.pushNamed(context, CustomerHome.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text('Profile'),
            onTap: () =>
                Navigator.pushNamed(context, CustomerProfile.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.add_task),
            title: const Text('View Issues'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewMyIssues()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Logout'),
            onTap: () {
              try {
                googleAuth.signOut();
                // _auth.disconnect();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Welcome(),
                  ),
                );
              } catch (e) {
                print(e);
              }
            },
          ),
        ],
      ),
    );
  }
}

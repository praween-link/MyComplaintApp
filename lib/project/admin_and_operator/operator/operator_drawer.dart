import 'package:complaintapp/project/admin_and_operator/home/profile/profile.dart';
import 'package:complaintapp/project/admin_and_operator/home_screen.dart';
import 'package:complaintapp/project/controller/common_controller.dart';
import 'package:complaintapp/project/welcome_scr/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OperatorDrawer extends StatelessWidget {
  const OperatorDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var commonProvider = Provider.of<CommonController>(context);
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
            title: Text(commonProvider.operatorLoginedData.name),
            subtitle: Text(commonProvider.operatorLoginedData.email),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () =>
                Navigator.pushNamed(context, HomeScreen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile'),
            onTap: () => Navigator.pushNamed(context, Profile.routeName),
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
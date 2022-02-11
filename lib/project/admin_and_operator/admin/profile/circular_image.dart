import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    Key? key,
    required this.imgurl,
  }) : super(key: key);
  final String imgurl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 68,
      backgroundColor: const Color(0xFF614ac2),
      child: GestureDetector(
        // onTap: () => Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => UserProfile(
        //       userid: usersListData[index]['id'],
        //       username:
        //           '${usersListData[index]['first_name']} ${usersListData[index]['last_name']}',
        //       useremail: usersListData[index]['email'],
        //       userprofileimage: usersListData[index]['avatar'],
        //     ),
        //   ),
        // ),
        child: CircleAvatar(
          radius: 64,
          backgroundColor: Colors.blueGrey[200],
          backgroundImage: NetworkImage(imgurl),
          // backgroundImage: const NetworkImage(
          //     'https://www.verywellfamily.com/thmb/WQay8Y-E2ZFJrr1TE5hcjz7bev4=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/181451278-56a258395f9b58b7d0c931fd.jpg'),
        ),
      ),
    );
  }
}

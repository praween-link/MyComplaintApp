import 'dart:io';
import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:complaintapp/project/admin_and_operator/home/top_ui_part/top_clippers.dart';
import 'package:complaintapp/project/admin_and_operator/admin/admin_drawer.dart';
import 'package:complaintapp/project/constants/decorations.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class UpdateProfile extends StatefulWidget {
  static const routeName = '/updateAdminProfile';
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  String category = '';

  final _formKey = GlobalKey<FormState>();
  String img = 'https://www.verywellfamily.com/thmb/WQay8Y-E2ZFJrr1TE5hcjz7bev4=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/181451278-56a258395f9b58b7d0c931fd.jpg';
  
  late String _imagePath = '';
  final _picker = ImagePicker();
  Future pickImage(ImageSource source) async {
    XFile? pickedFile = await _picker.pickImage(source: source);
    setState(() {
      File _image = File(pickedFile!.path);
      _imagePath = _image.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    // var bgimage = const NetworkImage(
    //     'https://www.awn.com/sites/default/files/styles/inline_wide/public/image/featured/1040167-original-songs-mexican-sounds-set-pixars-coco-soundtrack.jpg?itok=fCz310bu');
    var bgimage = const NetworkImage(
        'https://image.newyork.com.au/wp-content/uploads/2020/05/New-York-Skyline-Zoom.jpg');

    //
    Color category_color = const Color(0xffdce0df);
    var categoryCardList = [
      ElevatedButton(
        onPressed: () => setState(() => category = 'SPORT'),
        child: Text(
          'SPORT',
          style: TextStyle(color: category_color),
        ),
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: category == 'SPORT'
                ? const Color(0xFF270980)
                : const Color(0xffaca3cf)),
      ),
      const SizedBox(width: 10),
      ElevatedButton(
        onPressed: () => setState(() => category = 'MEDICAL'),
        child: Text(
          'MEDICAL',
          style: TextStyle(color: category_color),
        ),
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: category == 'MEDICAL'
                ? const Color(0xFF270980)
                : const Color(0xffaca3cf)),
      ),
      const SizedBox(width: 10),
      ElevatedButton(
        onPressed: () => setState(() => category = 'RENT'),
        child: Text(
          'RENT',
          style: TextStyle(color: category_color),
        ),
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: category == 'RENT'
                ? const Color(0xFF270980)
                : const Color(0xffaca3cf)),
      ),
      const SizedBox(width: 10),
      ElevatedButton(
        onPressed: () => setState(() => category = 'NOTES'),
        child: Text(
          'NOTES',
          style: TextStyle(color: category_color),
        ),
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: category == 'NOTES'
                ? const Color(0xFF270980)
                : const Color(0xffaca3cf)),
      ),
      const SizedBox(width: 10),
      ElevatedButton(
        onPressed: () => setState(() => category = 'TASK MANAGEMENT'),
        child: Text(
          'TASK MANAGEMENT',
          style: TextStyle(color: category_color),
        ),
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: category == 'TASK MANAGEMENT'
                ? const Color(0xFF270980)
                : const Color(0xffaca3cf)),
      ),
      const SizedBox(width: 10),
      ElevatedButton(
        onPressed: () => setState(() => category = 'PROJECT'),
        child: Text(
          'PROJECT',
          style: TextStyle(color: category_color),
        ),
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: category == 'PROJECT'
                ? const Color(0xFF270980)
                : const Color(0xffaca3cf)),
      ),
      const SizedBox(width: 10),
      ElevatedButton(
        onPressed: () => setState(() => category = '+ADD'),
        child: Text(
          '+ADD',
          style: TextStyle(color: category_color),
        ),
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: category == '+ADD'
                ? const Color(0xFF270980)
                : const Color(0xffaca3cf)),
      ),
      const SizedBox(width: 10),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(),
            //
            Stack(
              children: [
                ClipPath(
                  child: Container(
                    height: 205,
                    width: w,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        height: 100,
                        width: w,
                        decoration: BoxDecoration(
                          color: const Color(0xFF755fcf).withOpacity(0.2),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(400)),
                          // color: const Color(0xFF755fcf),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF614ac2),
                              Color(0xFF391e8a),
                              Color(0xFF270980),
                              Color(0xFF270980),
                              Color(0xFF755fcf),
                            ],
                            stops: [0.15, 0.4, 0.4, 0.4, 0.7],
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: bgimage,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(400)),
                      color: const Color(0xFF755fcf),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF614ac2),
                          Color(0xFF391e8a),
                          Color(0xFF270980),
                          Color(0xFF270980),
                          Color(0xFF755fcf),
                        ],
                        stops: [0.15, 0.4, 0.4, 0.4, 0.7],
                      ),
                    ),
                  ),
                  // clipper: HomeClipper(),
                ),
                ClipPath(
                  child: Container(
                    height: 210,
                    width: w,
                    decoration: const BoxDecoration(
                      color: Color(0xFF270980),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(200)),
                    ),
                  ),
                  clipper: RectHomeClipper(),
                ),
                ClipPath(
                  child: Container(
                    height: 210,
                    width: w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: bgimage,
                        fit: BoxFit.cover,
                      ),
                      color: const Color(0xFF391e8a),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(200)),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF391e8a),
                          Color(0xFF270980),
                          Color(0xFF270980),
                          Color(0xFF755fcf),
                        ],
                        stops: [0.0, 0.2, 0.1, 0.7],
                      ),
                    ),
                  ),
                  clipper: RectHomeClipper2(),
                ),
                Positioned(
                  bottom: 0,
                  left: 15,
                  child: Stack(children: [
                    CircleAvatar(
                    radius: 68.0,
                    backgroundColor: const Color(0xFF614ac2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(64.0),
                      child: (_imagePath == ''
                              ? Image.network(
                                  img,
                                  height: 128,
                                  width: 128,
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  File(_imagePath),
                                  height: 128,
                                  width: 128,
                                  fit: BoxFit.cover,
                                )
                    ),

                  ),),
                  Padding(
                        padding: const EdgeInsets.only(top: 70),
                        child: Container(
                          height: 55,
                          width: 55,
                          child: IconButton(
                            icon: const Icon(Icons.camera_alt, size: 35.0),
                            onPressed: () => pickImage(ImageSource.gallery),
                            color: Colors.grey[300],
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Colors.blue),
                        ),
                      ),
                  ],),
                ),
                //
              ],
            ),
            //
            Padding(
              padding: const EdgeInsets.only(
                top: 230.0,
                bottom: 45,
                left: 12.0,
                right: 12.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Name*",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Your name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Name cannot be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Mobile Number*",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Your mobile number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Mobile number cannot be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Email",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Your email number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Create Password*",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Create password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Address*",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Your address",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Address cannot be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Category*",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    Wrap(children: categoryCardList),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate() &&
                            category != '') {
                          AwesomeDialog(
                                  context: context,
                                  animType: AnimType.SCALE,
                                  dialogType: DialogType.SUCCES,
                                  body: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'Updated Successfully',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          "Your profile successfully updated!",
                                          style: TextStyle(fontSize: 16),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  btnOkOnPress: () => Navigator.pop(context),
                                  btnOkText: 'Go Back')
                              .show();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 28.0, right: 28.0, top: 10),
                        child: Container(
                          height: 60,
                          child: const Center(
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 28,
                              ),
                            ),
                          ),
                          decoration: boxDecoration2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: const AdminDrawer(),
    );
  }
}

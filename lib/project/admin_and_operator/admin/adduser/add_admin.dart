import 'package:complaintapp/project/admin_and_operator/home_screen.dart';
import 'package:complaintapp/project/constants/decorations.dart';
import 'package:complaintapp/project/controller/admin_controller.dart';
import 'package:complaintapp/project/models/admin.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:provider/provider.dart';

class AddAdmin extends StatefulWidget {
  static const routeName = '/addAdmin';
  const AddAdmin({Key? key}) : super(key: key);

  @override
  State<AddAdmin> createState() => _AddAdminState();
}

class _AddAdminState extends State<AddAdmin> {
  String name = '';
  String phone = '';
  String password = '';
  String email = '';
  String pincode = '';
  String state = '';
  String city = '';
  String area = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var adminController = Provider.of<AdminController>(context);
    Color category_color = const Color(0xffdce0df);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF755fcf),
        title: const Text("Add New Admin"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.chevron_left,
              size: 35,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Name*",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  onChanged: (value) => setState(() => name = value),
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
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  onChanged: (value) => setState(() => phone = value),
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
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  onChanged: (value) => setState(() => email = value),
                  decoration: InputDecoration(
                    hintText: "Your email number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Create Password*",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  onChanged: (value) => setState(() => password = value),
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
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  onChanged: (value) => setState(() => pincode = value),
                  decoration: InputDecoration(
                    hintText: "Pincode*",
                    label: const Text("Pincode*"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Cannot be empty!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  onChanged: (value) => setState(() => state = value),
                  decoration: InputDecoration(
                    hintText: "State*",
                    label: const Text("State*"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Cannot be empty!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  onChanged: (value) => setState(() => city = value),
                  decoration: InputDecoration(
                    hintText: "City*",
                    label: const Text("City*"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Cannot be empty!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  onChanged: (value) => setState(() => area = value),
                  decoration: InputDecoration(
                    hintText: "Area, Colony, Road Name*",
                    label: const Text("Area, Colony, Road Name*"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Cannot be empty!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // Text(
                //     '$name, $phone, $email, $password, $pincode, $state, $city, $area'),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      AdminAddress address = AdminAddress(
                          pincode: pincode,
                          state: state,
                          city: city,
                          area: area);
                      Admin admin = Admin(
                          name: name,
                          phone: phone,
                          password: password,
                          email: email,
                          address: address,
                          photo: '');
                      adminController.addNewAdmin(admin);
                      AwesomeDialog(
                              context: context,
                              animType: AnimType.SCALE,
                              dialogType: DialogType.SUCCES,
                              body: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Submitted Successfully',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Thank You!',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "We've received your submission, and we'll be in toush soon!",
                                      style: TextStyle(fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              btnOkOnPress: () => Navigator.pushNamed(
                                  context, HomeScreen.routeName),
                              btnOkText: 'Back to home')
                          .show();
                    }
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 28.0, right: 28.0, top: 10),
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
      ),
    );
  }
}

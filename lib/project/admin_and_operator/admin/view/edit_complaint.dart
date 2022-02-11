import 'package:complaintapp/project/admin_and_operator/admin/admin_home.dart';
import 'package:complaintapp/project/constants/decorations.dart';
import 'package:complaintapp/project/controller/admin_controller.dart';
import 'package:complaintapp/project/controller/customer_controller.dart';
import 'package:complaintapp/project/modle/issue.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:provider/provider.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class AdminEditIssue extends StatefulWidget {
  static const routeName = '/editIssue';
  const AdminEditIssue({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<AdminEditIssue> createState() => _AdminEditIssueState();
}

class _AdminEditIssueState extends State<AdminEditIssue> {
  String type = '';
  String title = '';
  String category = '';
  String description = '';
  String name = '';
  String phone = '';
  String pincode = '';
  String state = '';
  String city = '';
  String area = '';
  String locationTypeHome = '';
  final _formKey = GlobalKey<FormState>();
  //
  // final IssueController _issueController = Get.put(IssueController());
  bool run = true;
  void addDataOfDB() {
    var adminProvider = Provider.of<AdminController>(context);
    type = adminProvider.issues[widget.id]?.type ?? '';
    title = adminProvider.issues[widget.id]?.title ?? '';
    category = adminProvider.issues[widget.id]?.category ?? '';
    description = adminProvider.issues[widget.id]?.description ?? '';
    name = adminProvider.issues[widget.id]?.name ?? '';
    phone = adminProvider.issues[widget.id]?.phone ?? '';
    pincode = adminProvider.issues[widget.id]?.pincode ?? '';
    state = adminProvider.issues[widget.id]?.state ?? '';
    city = adminProvider.issues[widget.id]?.city ?? '';
    area = adminProvider.issues[widget.id]?.area ?? '';
    locationTypeHome = adminProvider.issues[widget.id]?.locationtype ?? '';
  }

  @override
  Widget build(BuildContext context) {
    var adminProvider = Provider.of<AdminController>(context, listen: false);
    var customerProvider = Provider.of<CustomerController>(context, listen: false);
    Color category_color = const Color(0xffdce0df);
    //-----
    if (run) {
      addDataOfDB();
      setState(() {
        run = false;
      });
    }
    //-----
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
        backgroundColor: const Color(0xFF755fcf),
        title: const Text("Edit Issue"),
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
                // Text(
                //     '{t:$title, c:$category, d:$description, n:$name, p:$phone, pin:$pincode, s:$state, ci:$city, a:$area, lt:$locationTypeHome}'),
                // GetBuilder<IssueController>(builder: (_) => Text('_${_issueController.mytitle}'),),
                // Obx(()=>Text('_${_issueController.mytitle.value}')),
                const Text(
                  "Title*",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  initialValue: title,
                  onChanged: (value) => setState(() => title = value),
                  decoration: InputDecoration(
                    hintText: "Problem title*",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Operator name cannot be empty!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                const Text(
                  "Category*",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                Wrap(children: categoryCardList),
                const SizedBox(height: 15),
                const Text(
                  "Description*",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  initialValue: description,
                  onChanged: (value) => setState(() => description = value),
                  decoration: InputDecoration(
                    hintText: "Problem description*",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  maxLines: 5,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Description cannot be empty!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                const Text(
                  "Add Location*",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  initialValue: name,
                  onChanged: (value) => setState(() => name = value),
                  decoration: InputDecoration(
                    hintText: "Your name*",
                    label: const Text("Name*"),
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
                const SizedBox(height: 15),
                TextFormField(
                  initialValue: phone,
                  onChanged: (value) => setState(() => phone = value),
                  decoration: InputDecoration(
                    hintText: "Your mobile number*",
                    label: const Text("Mobile Number*"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Cannot be empty!";
                    } else if (value.length < 10) {
                      return "Please enter valide phone number!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  initialValue: pincode,
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
                const SizedBox(height: 15),
                TextFormField(
                  initialValue: state,
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
                const SizedBox(height: 15),
                TextFormField(
                  initialValue: city,
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
                const SizedBox(height: 15),
                TextFormField(
                  initialValue: area,
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
                const SizedBox(height: 15),
                const Text(
                  "Type of location*",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Wrap(
                  children: [
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () =>
                          setState(() => locationTypeHome = 'home'),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Home',
                          style: TextStyle(color: category_color),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          primary: locationTypeHome == 'home'
                              ? const Color(0xFF270980)
                              : const Color(0xffaca3cf)),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () =>
                          setState(() => locationTypeHome = 'work'),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Work',
                          style: TextStyle(color: category_color),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          primary: locationTypeHome == 'work'
                              ? const Color(0xFF270980)
                              : const Color(0xffaca3cf)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate() && category != '') {
                      Issue issue = Issue(
                          type: type,
                          title: title,
                          category: category,
                          description: description,
                          datetime: DateTime.now().toString(),
                          name: name,
                          phone: phone,
                          email: _auth.currentUser!.email.toString(),
                          pincode: pincode,
                          state: state,
                          city: city,
                          area: area,
                          locationtype: locationTypeHome);
                      customerProvider.UpdateIssueToDB(issue, widget.id);
                      AwesomeDialog(
                              context: context,
                              animType: AnimType.SCALE,
                              dialogType: DialogType.SUCCES,
                              body: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                      "Successfully updated your issue!",
                                      style: TextStyle(fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              btnOkOnPress: () => Navigator.pushNamed(
                                  context, AdminHomeScreen.routeName),
                              btnOkText: 'Back to home')
                          .show();
                    }
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 28.0, right: 28.0, top: 10),
                    child: Container(
                      height: 65,
                      child: const Center(
                        child: Text(
                          'Update',
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
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

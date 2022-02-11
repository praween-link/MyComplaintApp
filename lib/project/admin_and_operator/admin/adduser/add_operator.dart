import 'package:complaintapp/project/constants/decorations.dart';
import 'package:complaintapp/project/customer/home/customer_home.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class AddOperator extends StatefulWidget {
  static const routeName = '/addOperator';
  const AddOperator({Key? key}) : super(key: key);

  @override
  State<AddOperator> createState() => _AddOperatorState();
}

class _AddOperatorState extends State<AddOperator> {
  TextEditingController _titleController = TextEditingController();

  TextEditingController _addressController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  TextEditingController _descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String category = '';

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: const Color(0xFF755fcf),
        title: const Text("Add New Operator"),
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
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                Wrap(children: categoryCardList),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate() && category != '') {
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
                                  context, CustomerHome.routeName),
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

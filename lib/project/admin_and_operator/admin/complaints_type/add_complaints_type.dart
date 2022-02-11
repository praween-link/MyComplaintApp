import 'package:complaintapp/project/controller/admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddComplaintType extends StatefulWidget {
  const AddComplaintType({Key? key}) : super(key: key);

  @override
  State<AddComplaintType> createState() => _AddComplaintTypeState();
}

class _AddComplaintTypeState extends State<AddComplaintType> {
  final _formKey = GlobalKey<FormState>();
  String type = '';

  @override
  Widget build(BuildContext context) {
    var adminProvider = Provider.of<AdminController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Oerator Decoration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: adminProvider.getComplaintTypesFromDB(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: bottomSheet(adminProvider, context),
                ),
              ),
            ),
          );
        },
        icon: const Icon(
          Icons.add_to_photos_sharp,
          size: 30.0,
          color: Colors.black87,
        ),
        label: const Text(
          'New Complaint Type',
          style: TextStyle(
              color: Colors.black87, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFaf93ed),
        elevation: 10,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Container bottomSheet(AdminController provider, BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 18.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  onChanged: (value) => setState(() {
                    type = value;
                  }),
                  decoration: const InputDecoration(
                    hintText: 'Add complaint type',
                    label: Text('Add complaint type'),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Field cannot be empty!';
                    } else if (val.length > 50) {
                      return "Please write less than 50 charactors!";
                    }
                  },
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 28.0, right: 28.0, top: 18.0, bottom: 28.0),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          provider.addCompalaintTypeToDB(type);
                          Navigator.pop(context);
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Add',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

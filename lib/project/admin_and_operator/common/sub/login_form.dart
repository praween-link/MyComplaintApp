import 'package:complaintapp/project/admin_and_operator/admin/admin_home.dart';
import 'package:complaintapp/project/constants/decorations.dart';
import 'package:complaintapp/project/controller/admin_controller.dart';
import 'package:complaintapp/project/controller/common_controller.dart';
import 'package:complaintapp/project/controller/login_controller.dart';
import 'package:complaintapp/project/controller/operator_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String phone = '';
  String password = '';
  bool viewPass = false;

  @override
  Widget build(BuildContext context) {
    var commonProvider = Provider.of<CommonController>(context);
    var adminProvider = Provider.of<AdminController>(context);
    var operatorProvider = Provider.of<OperatorController>(context);
    var loginProvider = Provider.of<LoginController>(context);
    // commonProvider.getUser();
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            TextFormField(
              onChanged: (value) => setState(() => phone = value),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                label: const Text('Mobile Number'),
                hintText: "Mobile number",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Mobile number field cannot be empty";
                } else if (commonProvider.isAdmin
                    ? !loginProvider.adminPhones.contains(value)
                    : !loginProvider.operatorsPhones.contains(value)) {
                  return 'Your mobile number is wrong!';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              onChanged: (value) => setState(() => password = value),
              obscureText: viewPass ? false : true,
              decoration: InputDecoration(
                  label: const Text('Password'),
                  hintText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  suffixIcon: IconButton(
                    icon: Icon(viewPass
                        ? Icons.visibility
                        : Icons.visibility_off), //remove_red_eye
                    onPressed: () => setState(() => viewPass = !viewPass),
                  )),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Password field cannot be empty";
                } else if (value.length < 6) {
                  return "Its length should be a minimum of 6!";
                } else if (commonProvider.isAdmin
                    ? loginProvider.adminPass[phone] != value
                    : loginProvider.operatorPass[phone] != value) {
                  return 'Password is wrong!';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            // Text(loginProvider.adminPhones.toString()),
            // Text(loginProvider.operatorsPhones.toString()),
            // Text(commonProvider.isAdmin.toString()),
            // Text(adminProvider.adminPhoneNo.contains(phone).toString()),
            // const Text('-------'),
            Text('Operator-> {Phone: pass} -> ${loginProvider.operatorPass.toString()}'),
            Text('Admin-> {Phone: pass} -> ${loginProvider.adminPass.toString()}'),
            // Text(loginProvider.adminPass[phone].toString()),
            // Text(loginProvider.operatorPass[phone].toString()),
            // Text('-------------${commonProvider.getStringValuesSF().toString()}'),
            // commonProvider.fd(),
            // Text(commonProvider.user),
            GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AdminHomeScreen(isAdmin: commonProvider.isAdmin),
                    ),
                  );
                }
              },
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 28.0, right: 28.0, top: 10),
                child: Container(
                  height: 80,
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
    );
  }
}

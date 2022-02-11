import 'package:complaintapp/project/admin_and_operator/admin/admin_home.dart';
import 'package:complaintapp/project/constants/decorations.dart';
import 'package:flutter/material.dart';

import 'admin_login_clipper_ui.dart';

class AdminAndOperatorLogin extends StatelessWidget {
  static const routeName = '/adminAndOperatorLogin';

  AdminAndOperatorLogin({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                const AdminLoginClipperUI(),
                //----------------------------------------------------------------

                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 2.4),
                    const Center(
                        child: Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 3),
                    )),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        "It's easier to sign in now",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    //
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            TextFormField(
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
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  label: const Text('Password'),
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.remove_red_eye),
                                    onPressed: () {},
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password field cannot be empty";
                                } else if (value.length < 6) {
                                  return "Its length should be a minimum of 6!";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 30),
                            GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pushNamed(
                                      context, AdminHomeScreen.routeName);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 28.0, right: 28.0, top: 10),
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
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

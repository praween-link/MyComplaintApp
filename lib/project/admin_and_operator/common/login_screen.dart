import 'package:flutter/material.dart';

import 'admin_login_clipper_ui.dart';
import 'sub/login_form.dart';
import 'sub/select_user_button.dart';

class AdminAndOperatorLogin extends StatefulWidget {
  static const routeName = '/adminAndOperatorLogin';

  const AdminAndOperatorLogin({Key? key}) : super(key: key);

  @override
  State<AdminAndOperatorLogin> createState() => _AdminAndOperatorLoginState();
}

class _AdminAndOperatorLoginState extends State<AdminAndOperatorLogin> {

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
                    SizedBox(height: MediaQuery.of(context).size.height / 2.6),
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
                    const SizedBox(height: 10),
                    const SelectUserButton(),
                    //
                    const LoginForm(),
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


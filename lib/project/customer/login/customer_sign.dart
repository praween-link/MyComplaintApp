import 'package:complaintapp/project/constants/decorations.dart';
import 'package:complaintapp/project/customer/home/customer_home.dart';
import 'package:complaintapp/project/customer/login/google/auth.dart';
import 'package:flutter/material.dart';

import 'clipper_ui.dart';
class CustomerLogin extends StatelessWidget {
  static const routeName = '/customerlogin';

  CustomerLogin({Key? key}) : super(key: key);
  GoogleFirebaseAuth googleAuth = GoogleFirebaseAuth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              const LoginClipperUI(),
              //----------------------------------------------------------------

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 2.4),
                  const Center(
                      child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 3),
                  )),
                  const SizedBox(height: 10),
                  Center(
                      child: Text("It's easier to sign up now",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2))),
                  const SizedBox(height: 30),
                  //
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: GestureDetector(
                      onTap: () async {
                        final user = await googleAuth.signInWithGoogle();
                        // ignore: unnecessary_null_comparison
                        if (user != null) {
                          await Future.delayed(const Duration(seconds: 1));
                          // cuser.updateProfile()
                          // Navigator.pushNamed(context, Continue.touteName);
                          // Provider.of<Data>(context).newAddCustomer(
                          //     FirebaseAuth.instance.currentUser!.uid.toString(),
                          //     FirebaseAuth.instance.currentUser!.email
                          //         .toString());
                          
                          Navigator.pushNamed(context, CustomerHome.routeName);
                        }
                      } ,
                      child: Container(
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 6.0, right: 6.0),
                            child: ListTile(
                              leading: Image.asset('assets/img/google.png'),
                              title: const Text(
                                "Continue with google",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        height: 80,
                        decoration: loginBoxDecoration,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Text(
                      "Already have account? Continue with same continue with google!",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

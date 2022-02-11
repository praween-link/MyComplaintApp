

import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';


// ignore: unused_element
final _auth = FirebaseAuth.instance;
// LocalStorage localStorage = LocalStorage();

class GoogleFirebaseAuth {
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      var user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return user;
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
  // final settingsController = SettingsController(SettingsService());
  Future<void> signOut() async {
    // await settingsController.loadSettings();

    // await _auth.signOut();
    GoogleSignIn _googleSignIn = GoogleSignIn();
    // _googleSignIn.disconnect();
    await _googleSignIn.signOut();

    // main();
  }
}

// SHA! : ./gradlew signingReport
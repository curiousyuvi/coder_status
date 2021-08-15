import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<User> logout(context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await GoogleSignIn().disconnect();
    await _auth.signOut();
    Phoenix.rebirth(context);
  } catch (e) {
    print("error");
  }
}

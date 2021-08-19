import 'package:firebase_auth/firebase_auth.dart';

resetpassword(String email) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    _auth.sendPasswordResetEmail(email: email);
  } catch (e) {}
}

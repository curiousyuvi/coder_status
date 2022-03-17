import 'package:firebase_auth/firebase_auth.dart';

sendVerificationEmail(String email) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var user = _auth.currentUser;
  user!.sendEmailVerification();
}

Future<bool> checkEmailVerified() async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var user = _auth.currentUser;
  user!.reload();

  if (user.emailVerified) {
    return true;
  } else {
    return false;
  }
}

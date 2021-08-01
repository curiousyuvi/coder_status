import 'package:codersstatus/firebase_layer/setUserInfo.dart';
import 'package:firebase_auth/firebase_auth.dart';

sendVerificationEmail(String email) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var user = _auth.currentUser;
  user.sendEmailVerification();
}

Future<bool> checkEmailVerified() async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var user = _auth.currentUser;
  user.reload();
  print('checking verification status');

  if (user.emailVerified) {
    print('email verified');
    return true;
  } else {
    print('email not verified');
    return false;
  }
}

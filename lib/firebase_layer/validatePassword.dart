import 'package:firebase_auth/firebase_auth.dart';

Future<bool> validatePassword(String password) async {
  var authCredentials = EmailAuthProvider.credential(
      email: FirebaseAuth.instance.currentUser!.email as String,
      password: password);

  try {
    var authResult = await FirebaseAuth.instance.currentUser!
        .reauthenticateWithCredential(authCredentials);
    return authResult.user != null;
  } catch (e) {
    return false;
  }
}

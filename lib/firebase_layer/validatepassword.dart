import 'package:firebase_auth/firebase_auth.dart';

Future<bool> validatePassword(String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User currentUser = _auth.currentUser;
    var authCredentials = EmailAuthProvider.credential(
        email: currentUser.email, password: password);

    var authResult =
        await currentUser.reauthenticateWithCredential(authCredentials);
    return authResult.user != null;
  } catch (e) {
    print("error: " + e);
    return false;
  }
}

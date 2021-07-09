import 'package:firebase_auth/firebase_auth.dart';

Future deleteUser(String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User currentUser = _auth.currentUser;
    var authCredentials = EmailAuthProvider.credential(
        email: currentUser.email, password: password);

    var authResult =
        await currentUser.reauthenticateWithCredential(authCredentials);
    authResult.user.delete();
    print('user deleted succesfully!!!');
  } catch (e) {
    print(e);
  }
}

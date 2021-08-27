import 'package:firebase_auth/firebase_auth.dart';

updatePassword(String oldpassword, String newpassword) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  final currentuser = _auth.currentUser;
  final user = currentuser;
  final cred =
      EmailAuthProvider.credential(email: user.email, password: oldpassword);

  user.reauthenticateWithCredential(cred).then((value) {
    user.updatePassword(newpassword).then((_) {}).catchError((error) {});
  }).catchError((err) {});
}

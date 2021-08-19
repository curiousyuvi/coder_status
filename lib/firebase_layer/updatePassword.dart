import 'package:firebase_auth/firebase_auth.dart';

Future<User> updatePassword(String oldpassword, String newpassword) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  final currentuser = _auth.currentUser;
  final user = await FirebaseAuth.instance.currentUser;
  final cred =
      EmailAuthProvider.credential(email: user.email, password: oldpassword);

  user.reauthenticateWithCredential(cred).then((value) {
    user.updatePassword(newpassword).then((_) {}).catchError((error) {});
  }).catchError((err) {});
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future deleteUser(String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User currentUser = _auth.currentUser;
    var authCredentials = EmailAuthProvider.credential(
        email: currentUser.email, password: password);

    var authResult =
        await currentUser.reauthenticateWithCredential(authCredentials);
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser.uid)
        .delete();
    authResult.user.delete();
    print('user deleted succesfully!!!');
  } catch (e) {
    print(e);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future deleteUser([String password = '']) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User? user = _auth.currentUser;
    var authCredentials;
    if (user!.photoURL == null)
      authCredentials =
          EmailAuthProvider.credential(email: user.email, password: password);
    else {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser!.authentication;
      authCredentials = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    }

    var authResult = await user.reauthenticateWithCredential(authCredentials);
    await FirebaseFirestore.instance.collection("users").doc(user.uid).delete();
    authResult.user!.delete();
  } catch (e) {}
}

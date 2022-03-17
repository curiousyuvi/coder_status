import 'package:firebase_auth/firebase_auth.dart';

login(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User? user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;

    if (user != null) {
      return user;
    } else {
      return user;
    }
  } catch (e) {}
}

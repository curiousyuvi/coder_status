import 'package:firebase_auth/firebase_auth.dart';

createAccount(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (user != null) {
      return user;
    } else {
      return user;
    }
  } catch (e) {}
}

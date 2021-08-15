import 'package:firebase_auth/firebase_auth.dart';

Future<User> login(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;

    if (user != null) {
      final url = user.photoURL;
      print("login succesfull\n\n\n\n\n$url\n\n\n\n\n");
      return user;
    } else {
      print("Login failed!!");
      return user;
    }
  } catch (e) {
    print(e);
  }
}

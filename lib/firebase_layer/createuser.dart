import 'package:firebase_auth/firebase_auth.dart';

Future<User> createAccount(
    String name, String codername, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (user != null) {
      print("Account Succesfully created!!");
      return user;
    } else {
      print("Account creation failed!!");
      return user;
    }
  } catch (e) {
    print(e);
  }
}

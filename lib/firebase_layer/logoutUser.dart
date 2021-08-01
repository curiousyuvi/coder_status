import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_restart/flutter_restart.dart';

Future<User> logout(context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut();
    Phoenix.rebirth(context);
  } catch (e) {
    print("error");
  }
}

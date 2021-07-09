import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_restart/flutter_restart.dart';

Future<User> logout(context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut();
    FlutterRestart.restartApp();
  } catch (e) {
    print("error");
  }
}

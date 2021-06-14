import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'signinscreen.dart';

Future<User> resetpassword(String email) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    _auth.sendPasswordResetEmail(email: email);

  } catch (e) {
    print("error in resetting password");
  }
}

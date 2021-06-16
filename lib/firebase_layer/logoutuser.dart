import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:codersstatus/signinscreen.dart';

Future<User> logout(context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    _auth.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return signinscreen();
    }));
  } catch (e) {
    print("error");
  }
}

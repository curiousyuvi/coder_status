import 'package:coderstatus/components/colorscheme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restart/flutter_restart.dart';

Future<User> updatePassword(String oldpassword, String newpassword) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  final currentuser = _auth.currentUser;
  final user = await FirebaseAuth.instance.currentUser;
  final cred =
      EmailAuthProvider.credential(email: user.email, password: oldpassword);

  user.reauthenticateWithCredential(cred).then((value) {
    user.updatePassword(newpassword).then((_) {
      print('pass updated!!');
    }).catchError((error) {
      print(error);
    });
  }).catchError((err) {
    print(err);
  });
}

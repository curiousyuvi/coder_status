import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codersstatus/components/generalLoadingScreen.dart';
import 'package:codersstatus/firebase_layer/getUserInfo.dart';
import 'package:codersstatus/homescreen.dart';
import 'package:codersstatus/registerNameScreen.dart';
import 'package:codersstatus/signinScreen.dart';
import 'package:codersstatus/verifyEmailScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;

  bool flag = false;

  Future updateFlag() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(_auth.currentUser.uid)
        .get()
        .then((doc) {
      flag = doc.exists;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: updateFlag(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (_auth.currentUser != null) {
            if (_auth.currentUser.emailVerified) {
              if (flag) {
                return HomeScreen();
              } else {
                return Registernamescreen();
              }
            } else {
              return VerifyEmailScreen();
            }
          } else {
            return Signinscreen();
          }
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

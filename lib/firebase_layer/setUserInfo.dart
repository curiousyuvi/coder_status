import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codersstatus/mydashboardscreen.dart';
import 'package:codersstatus/signinscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SetUserInfo {
  static Future setUserCredentials(
      String name,
      String codername,
      String avatarurl,
      String codeforces,
      String codechef,
      String atcoder,
      String spoj) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    final uid = user.uid;
    return await FirebaseFirestore.instance.collection("users").doc(uid).set({
      "name": name,
      "codername": codername,
      "avatarurl": avatarurl,
      "codeforces": codeforces,
      "codechef": codechef,
      "atcoder": atcoder,
      "spoj": spoj
    });
  }

  static Future updateAvatar(String urltobeupdated) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    final uid = user.uid;

    return await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({'avatarurl': urltobeupdated});
  }

  static Future updateHandles(
      String codeforces, String codechef, String atcoder, String spoj) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    final uid = user.uid;

    return await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({
      "codeforces": codeforces,
      "codechef": codechef,
      "atcoder": atcoder,
      "spoj": spoj
    });
  }
}

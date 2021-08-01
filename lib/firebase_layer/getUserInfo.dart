import 'package:codersstatus/myDashboardScreen.dart';
import 'package:codersstatus/signinScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetUserInfo {
  static Future<String> getUserName() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    final uid = user.uid;
    final mapofdocument =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    String name = mapofdocument.data()['name'];
    print(name);
    return name;
  }

  static Future<String> getUserCoderName() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    final uid = user.uid;
    final mapofdocument =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    String codername = mapofdocument.data()['codername'];
    print(codername);
    return codername;
  }

  static Future<String> getUserAvatarUrl() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    final uid = user.uid;
    final mapofdocument =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    String avatarurl = mapofdocument.data()['avatarurl'];
    print(avatarurl);
    return avatarurl;
  }

  static Future<List<String>> getUserHandles() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    final uid = user.uid;
    final mapofdocument =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    String codeforces = mapofdocument.data()['codeforces'];
    String codechef = mapofdocument.data()['codechef'];
    String atcoder = mapofdocument.data()['atcoder'];
    String spoj = mapofdocument.data()['spoj'];
    return [codeforces, codechef, atcoder, spoj];
  }

  static getUserEmail() {
    FirebaseAuth _auth = FirebaseAuth.instance;

    String email = _auth.currentUser.email;
    return email;
  }
}

import 'package:codersstatus/homescreen.dart';
import 'package:codersstatus/signinscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetUserInfo {
  static Future getUserName() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    final uid = user.uid;
    final mapofdocument =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    String name = mapofdocument.data()['name'];
    print(name);
    return name;
  }

  static Future getUserCoderName() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    final uid = user.uid;
    final mapofdocument =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    String codername = mapofdocument.data()['codername'];
    print(codername);
    return codername;
  }

  static Future getUserAvatarUrl() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    final uid = user.uid;
    final mapofdocument =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    String avatarurl = mapofdocument.data()['avatarurl'];
    print(avatarurl);
    return avatarurl;
  }
}

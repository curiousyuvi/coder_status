import 'package:codersstatus/myDashboardScreen.dart';
import 'package:codersstatus/signinScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetUserInfo {
  static getUserDocument([String uid = '']) async {
    if (uid == '') {
      FirebaseAuth _auth = FirebaseAuth.instance;
      final user = _auth.currentUser;
      uid = user.uid.toString();
    }
    final mapofdocument =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    return mapofdocument.data();
  }

  static Future<String> getUserName([String uid = '']) async {
    if (uid == '') {
      FirebaseAuth _auth = FirebaseAuth.instance;
      final user = _auth.currentUser;
      uid = user.uid.toString();
    }

    final mapofdocument =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    String name = mapofdocument.data()['name'];
    print(name);
    return name;
  }

  static Future<String> getUserCoderName([String uid = '']) async {
    if (uid == '') {
      FirebaseAuth _auth = FirebaseAuth.instance;
      final user = _auth.currentUser;
      uid = user.uid.toString();
    }
    final mapofdocument =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    String codername = mapofdocument.data()['codername'];
    print(codername);
    return codername;
  }

  static Future<String> getUserAvatarUrl([String uid = '']) async {
    if (uid == '') {
      FirebaseAuth _auth = FirebaseAuth.instance;
      final user = _auth.currentUser;
      uid = user.uid.toString();
    }
    final mapofdocument =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    String avatarurl = mapofdocument.data()['avatarurl'];
    print(avatarurl);
    return avatarurl;
  }

  static Future<String> getUserBio([String uid = '']) async {
    if (uid == '') {
      FirebaseAuth _auth = FirebaseAuth.instance;
      final user = _auth.currentUser;
      uid = user.uid.toString();
    }
    final mapofdocument =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    String bio = mapofdocument.data()['bio'];
    print(bio);
    return bio;
  }

  static getUserSeachKey([String uid = '']) async {
    if (uid == '') {
      FirebaseAuth _auth = FirebaseAuth.instance;
      final user = _auth.currentUser;
      uid = user.uid.toString();
    }
    final mapofdocument =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    var searchKey = mapofdocument.data()['searchKey'];

    return searchKey;
  }

  static Future<List<String>> getUserHandles([String uid = '']) async {
    if (uid == '') {
      FirebaseAuth _auth = FirebaseAuth.instance;
      final user = _auth.currentUser;
      uid = user.uid.toString();
    }
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

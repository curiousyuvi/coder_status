import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coder_status/firebase_layer/getUserInfo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SetUserInfo {
  static Future setUserCredentials(
      String name,
      String codername,
      String avatarurl,
      String bio,
      String codeforces,
      String codechef,
      String spoj,
      String atcoder) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    final uid = user.uid.toString();
    List<String> emptyList = [];
    return await FirebaseFirestore.instance.collection("users").doc(uid).set({
      "name": name,
      "codername": codername,
      "bio": bio,
      "avatarurl": avatarurl,
      "codeforces": codeforces,
      "codechef": codechef,
      "atcoder": atcoder,
      "spoj": spoj,
      "searchKey": [name[0].toUpperCase(), codername[0].toUpperCase()],
      "id": uid,
      "peers": emptyList
    });
  }

  static Future updateName(String name) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    final uid = user.uid.toString();

    var searchKey = await GetUserInfo.getUserSeachKey();

    searchKey[0] = name[0].toUpperCase();

    return await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({'name': name, 'searchKey': searchKey});
  }

  static Future updateCodername(String codername) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    final uid = user.uid;

    var searchKey = await GetUserInfo.getUserSeachKey();

    searchKey[1] = codername[0].toUpperCase();

    return await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({'codername': codername, 'searchKey': searchKey});
  }

  static Future updateAvatar(String urltobeupdated) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    final uid = user.uid.toString();

    return await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({'avatarurl': urltobeupdated});
  }

  static Future updateBio(String bio) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    final uid = user.uid;

    return await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({'bio': bio});
  }

  static Future updatePeers(var peers) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    final uid = user.uid;

    if (peers == null) {
      List<String> emptyList = [];
      peers = [];
    }

    return await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({'peers': peers});
  }

  static Future updateHandles(
      String codeforces, String codechef, String atcoder, String spoj) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    final uid = user.uid.toString();

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

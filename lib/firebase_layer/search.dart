import 'package:cloud_firestore/cloud_firestore.dart';

class SearchDatabase {
  searchByKey(String searchfield) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .where('searchKey', arrayContains: searchfield)
        .get();
  }
}

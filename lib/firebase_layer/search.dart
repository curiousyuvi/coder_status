import 'package:cloud_firestore/cloud_firestore.dart';

class SearchDatabase {
  searchByName(String searchfield) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .where('searchKey', arrayContains: searchfield.substring(0, 1))
        .get();
  }
}

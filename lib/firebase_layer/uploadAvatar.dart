import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class UploadUserAvatar {
  static Future<String> uploadUserAvatar(File avatarImageFile) async {
    UploadTask imageUploadTask;
    FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    final uid = user.uid;

    Reference imageReference = FirebaseStorage.instance
        .ref()
        .child(uid + 'avatar' + DateTime.now().toString());

    imageUploadTask = imageReference.putFile(avatarImageFile);
    await imageUploadTask.whenComplete(() {});
    var dowurl = await imageReference.getDownloadURL();

    String url = dowurl.toString();

    return url;
  }
}

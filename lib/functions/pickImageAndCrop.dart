import 'dart:io';
import 'package:coderstatus/components/colorscheme.dart';
import 'package:coderstatus/components/myButton.dart';
import 'package:coderstatus/firebase_layer/logoutUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../components/myAvatarButton.dart';

final picker = ImagePicker();

Image avatarimage = Image(image: AssetImage('images/avatar1.jpg'));

Future<File> cropSquareImage(File imageFile) async {
  return await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      aspectRatioPresets: [CropAspectRatioPreset.square]);
}

Future<File> pickimage() async {
  final pickedfile = await picker.getImage(source: ImageSource.gallery);
  if (pickedfile == null) return null;
  final croppedfile = await cropSquareImage(File(pickedfile.path));

  if (croppedfile != null)
    return croppedfile;
  else
    return null;
}

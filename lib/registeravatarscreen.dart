import 'dart:io';

import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/myButton.dart';
import 'package:codersstatus/logoutuser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'components/myAvatarButton.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MaterialApp(
      home: registeravatarscreen(),
    ));

class registeravatarscreen extends StatefulWidget {
  const registeravatarscreen({Key key}) : super(key: key);

  @override
  _registeravatarscreenState createState() => _registeravatarscreenState();
}

class _registeravatarscreenState extends State<registeravatarscreen> {
  final picker = ImagePicker();

  Image avatarimage = Image(image: AssetImage('images/avatar1.jpg'));

  Future<File> cropSquareImage(File imageFile) async {
    return await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        aspectRatioPresets: [CropAspectRatioPreset.square]);
  }

  Future pickimage() async {
    final pickedfile = await picker.getImage(source: ImageSource.gallery);
    if (pickedfile == null) return null;
    final croppedfile = await cropSquareImage(File(pickedfile.path));
    setState(() {
      if(croppedfile!=null)
      avatarimage = Image.file(File(croppedfile.path));
    });
  }

  List<bool> _selections = [
    false,
    true,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<Widget> _avatarbuttons = [
    myAvatarButton(AssetImage('images/avatar0.jpg'), false),
    myAvatarButton(AssetImage('images/avatar1.jpg'), true),
    myAvatarButton(AssetImage('images/avatar2.jpg'), false),
    myAvatarButton(AssetImage('images/avatar3.jpg'), false),
    myAvatarButton(AssetImage('images/avatar4.jpg'), false),
    myAvatarButton(AssetImage('images/avatar5.jpg'), false),
    myAvatarButton(AssetImage('images/avatar6.jpg'), false),
    myAvatarButton(AssetImage('images/avatar7.jpg'), false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image(
                      image: AssetImage('images/appiconnoback.png'),
                      height: 100,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Flexible(
                    child: Text(
                  'Select an Avatar',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'young', fontSize: 25),
                )),
                SizedBox(height: 20),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: colorschemeclass.primarygreen,
                            blurRadius: 20)
                      ],
                      border: Border.all(
                          color: colorschemeclass.primarygreen, width: 5),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fitWidth, image: avatarimage.image)),
                ),
                SizedBox(height: 20),
                Flexible(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ToggleButtons(
                      isSelected: _selections,
                      children: _avatarbuttons,
                      onPressed: (int index) {
                        setState(() {
                          for (int i = 0; i < 8; i++) {
                            _selections[i] = false;
                          }
                          _avatarbuttons[0] = myAvatarButton(
                              AssetImage('images/avatar0.jpg'), false);
                          _avatarbuttons[1] = myAvatarButton(
                              AssetImage('images/avatar1.jpg'), false);
                          _avatarbuttons[2] = myAvatarButton(
                              AssetImage('images/avatar2.jpg'), false);
                          _avatarbuttons[3] = myAvatarButton(
                              AssetImage('images/avatar3.jpg'), false);
                          _avatarbuttons[4] = myAvatarButton(
                              AssetImage('images/avatar4.jpg'), false);
                          _avatarbuttons[5] = myAvatarButton(
                              AssetImage('images/avatar5.jpg'), false);
                          _avatarbuttons[6] = myAvatarButton(
                              AssetImage('images/avatar6.jpg'), false);
                          _avatarbuttons[7] = myAvatarButton(
                              AssetImage('images/avatar7.jpg'), false);

                          _selections[index] = true;
                          if (index > 0) {
                            avatarimage = Image(
                              image: AssetImage('images/avatar$index.jpg'),
                            );
                          } else {
                            pickimage();
                          }
                          _avatarbuttons[index] = myAvatarButton(
                              AssetImage('images/avatar$index.jpg'), true);
                        });
                      },
                      renderBorder: false,
                      fillColor: Colors.transparent,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Flexible(
                    child: Row(
                  children: [
                    Flexible(child: myButton(false, 'Skip', () {})),
                    Flexible(child: myButton(true, 'Add Avatar', () {}))
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

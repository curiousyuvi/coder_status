import 'dart:io';
import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/myButton.dart';
import 'package:codersstatus/components/urls.dart';
import 'package:codersstatus/firebase_layer/logoutuser.dart';
import 'package:codersstatus/firebase_layer/setUserInfo.dart';
import 'package:codersstatus/firebase_layer/uploadAvatar.dart';
import 'package:codersstatus/homescreen.dart';
import 'package:codersstatus/mydashboardscreen.dart';
import 'package:codersstatus/registerbadgesscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'components/myAvatarButton.dart';
import 'functions/pickImageAndCrop.dart' as pickImageAndCrop;
import 'components/myCircleAvatar.dart';

void main() => runApp(MaterialApp(
      home: registeravatarscreen(),
    ));

class registeravatarscreen extends StatefulWidget {
  const registeravatarscreen({Key key}) : super(key: key);

  @override
  _registeravatarscreenState createState() => _registeravatarscreenState();
}

class _registeravatarscreenState extends State<registeravatarscreen> {
  Image avatarshowimage = Image(image: NetworkImage(urls.avatar1url));
  File imagetobeuploaded = null;
  String urltobeset = urls.avatar1url;

  getandupdateurl(File imagefile) async {
    final url = await UploadUserAvatar.uploadUserAvatar(imagefile);

    SetUserInfo.updateAvatar(url);
  }

  pick() async {
    urltobeset = null;
    final pickedfile = await pickImageAndCrop.pickimage();
    imagetobeuploaded = pickedfile;

    setState(() {
      avatarshowimage = Image.file(pickedfile);
    });

    return;
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
    myAvatarButton(Image(image: AssetImage('images/avatar0.jpg')), false),
    myAvatarButton(Image(image: AssetImage('images/avatar1.jpg')), true),
    myAvatarButton(Image(image: AssetImage('images/avatar2.jpg')), false),
    myAvatarButton(Image(image: AssetImage('images/avatar3.jpg')), false),
    myAvatarButton(Image(image: AssetImage('images/avatar4.jpg')), false),
    myAvatarButton(Image(image: AssetImage('images/avatar5.jpg')), false),
    myAvatarButton(Image(image: AssetImage('images/avatar6.jpg')), false),
    myAvatarButton(Image(image: AssetImage('images/avatar7.jpg')), false),
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
                    child: myCircleAvatar(avatarimage: avatarshowimage)),
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
                              Image(image: AssetImage('images/avatar0.jpg')),
                              false);
                          _avatarbuttons[1] = myAvatarButton(
                              Image(image: AssetImage('images/avatar1.jpg')),
                              false);
                          _avatarbuttons[2] = myAvatarButton(
                              Image(image: AssetImage('images/avatar2.jpg')),
                              false);
                          _avatarbuttons[3] = myAvatarButton(
                              Image(image: AssetImage('images/avatar3.jpg')),
                              false);
                          _avatarbuttons[4] = myAvatarButton(
                              Image(image: AssetImage('images/avatar4.jpg')),
                              false);
                          _avatarbuttons[5] = myAvatarButton(
                              Image(image: AssetImage('images/avatar5.jpg')),
                              false);
                          _avatarbuttons[6] = myAvatarButton(
                              Image(image: AssetImage('images/avatar6.jpg')),
                              false);
                          _avatarbuttons[7] = myAvatarButton(
                              Image(image: AssetImage('images/avatar7.jpg')),
                              false);

                          _selections[index] = true;
                          if (index > 0) {
                            imagetobeuploaded = null;

                            switch (index) {
                              case 1:
                                {
                                  urltobeset = urls.avatar1url;
                                }
                                break;
                              case 2:
                                {
                                  urltobeset = urls.avatar2url;
                                }
                                break;
                              case 3:
                                {
                                  urltobeset = urls.avatar3url;
                                }
                                break;
                              case 4:
                                {
                                  urltobeset = urls.avatar4url;
                                }
                                break;
                              case 5:
                                {
                                  urltobeset = urls.avatar5url;
                                }
                                break;
                              case 6:
                                {
                                  urltobeset = urls.avatar6url;
                                }
                                break;
                              case 7:
                                {
                                  urltobeset = urls.avatar7url;
                                }
                                break;
                            }

                            avatarshowimage = Image(
                              image: AssetImage('images/avatar$index.jpg'),
                            );
                          } else {
                            pick();
                          }
                          _avatarbuttons[index] = myAvatarButton(
                              Image(
                                  image: AssetImage('images/avatar$index.jpg')),
                              true);
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
                    Flexible(
                        child: myButton(false, 'Skip', () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomeScreen();
                      }));
                    })),
                    Flexible(
                        child: myButton(true, 'Add Avatar', () {
                      if (urltobeset != null) {
                        SetUserInfo.updateAvatar(urltobeset);

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HomeScreen();
                        }));
                      } else if (imagetobeuploaded != null) {
                        getandupdateurl(imagetobeuploaded);

                        print('Avatar updated!!');
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return registerbadgesscreen();
                        }));
                      }
                    }))
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

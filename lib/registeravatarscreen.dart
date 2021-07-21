import 'dart:io';
import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/myButton.dart';
import 'package:codersstatus/components/myFtoast.dart';
import 'package:codersstatus/components/myOutlineButton.dart';
import 'package:codersstatus/components/urls.dart';
import 'package:codersstatus/firebase_layer/setUserInfo.dart';
import 'package:codersstatus/firebase_layer/uploadAvatar.dart';
import 'package:codersstatus/registerbadgesscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'components/myAvatarSelection.dart';
import 'functions/pickImageAndCrop.dart' as pickImageAndCrop;
import 'components/myCircleAvatar.dart';

class Registeravatarscreen extends StatefulWidget {
  const Registeravatarscreen({Key key}) : super(key: key);

  @override
  _RegisteravatarscreenState createState() => _RegisteravatarscreenState();
}

class _RegisteravatarscreenState extends State<Registeravatarscreen> {
  Image avatarshowimage = Image(image: NetworkImage(urls.avatar1url));
  File imagetobeuploaded;
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
    myAvatarSelection(Image(image: AssetImage('images/avatar0.jpg')), false),
    myAvatarSelection(Image(image: AssetImage('images/avatar1.jpg')), true),
    myAvatarSelection(Image(image: AssetImage('images/avatar2.jpg')), false),
    myAvatarSelection(Image(image: AssetImage('images/avatar3.jpg')), false),
    myAvatarSelection(Image(image: AssetImage('images/avatar4.jpg')), false),
    myAvatarSelection(Image(image: AssetImage('images/avatar5.jpg')), false),
    myAvatarSelection(Image(image: AssetImage('images/avatar6.jpg')), false),
    myAvatarSelection(Image(image: AssetImage('images/avatar7.jpg')), false),
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
                          _avatarbuttons[0] = myAvatarSelection(
                              Image(image: AssetImage('images/avatar0.jpg')),
                              false);
                          _avatarbuttons[1] = myAvatarSelection(
                              Image(image: AssetImage('images/avatar1.jpg')),
                              false);
                          _avatarbuttons[2] = myAvatarSelection(
                              Image(image: AssetImage('images/avatar2.jpg')),
                              false);
                          _avatarbuttons[3] = myAvatarSelection(
                              Image(image: AssetImage('images/avatar3.jpg')),
                              false);
                          _avatarbuttons[4] = myAvatarSelection(
                              Image(image: AssetImage('images/avatar4.jpg')),
                              false);
                          _avatarbuttons[5] = myAvatarSelection(
                              Image(image: AssetImage('images/avatar5.jpg')),
                              false);
                          _avatarbuttons[6] = myAvatarSelection(
                              Image(image: AssetImage('images/avatar6.jpg')),
                              false);
                          _avatarbuttons[7] = myAvatarSelection(
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
                          _avatarbuttons[index] = myAvatarSelection(
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
                        child: Container(
                      child: myOutlineButton(colorschemeclass.lightgrey, 'Skip',
                          () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Registerbadgesscreen();
                        }));
                      }),
                    )),
                    Flexible(
                        child: Container(
                      child: myButton(
                          colorschemeclass.primarygreen, 'Add Avatar', () {
                        if (urltobeset != null) {
                          SetUserInfo.updateAvatar(urltobeset);
                          showFToast(
                              this.context, 'Avatar Added Succesfully', true);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Registerbadgesscreen();
                          }));
                        } else if (imagetobeuploaded != null) {
                          getandupdateurl(imagetobeuploaded);

                          showFToast(
                              this.context, 'Avatar Added Succesfully', true);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Registerbadgesscreen();
                          }));
                        }
                      }),
                    ))
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

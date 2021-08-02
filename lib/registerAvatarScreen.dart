import 'dart:io';
import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/myButton.dart';
import 'package:codersstatus/components/myOutlineButton.dart';
import 'package:codersstatus/components/showAnimatedToast.dart';
import 'package:codersstatus/components/urls.dart';
import 'package:codersstatus/firebase_layer/setUserInfo.dart';
import 'package:codersstatus/firebase_layer/uploadAvatar.dart';
import 'package:codersstatus/registerBadgesScreen.dart';
import 'package:codersstatus/registerBioScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'components/myAvatarSelection.dart';
import 'functions/pickImageAndCrop.dart' as pickImageAndCrop;
import 'components/myCircleAvatar.dart';

class Registeravatarscreen extends StatefulWidget {
  Registeravatarscreen(String name, String codername) {
    _RegisteravatarscreenState.name = name;
    _RegisteravatarscreenState.codername = codername;
  }

  @override
  _RegisteravatarscreenState createState() => _RegisteravatarscreenState();
}

class _RegisteravatarscreenState extends State<Registeravatarscreen> {
  static String name = '';
  static String codername = '';
  Image avatarshowimage = Image(image: NetworkImage(urls.avatar1url));
  File imagetobeuploaded;
  String urltobeset = urls.avatar1url;
  bool isLoading = false;

  Future<String> generateUrl(File imagefile) async {
    final url = await UploadUserAvatar.uploadUserAvatar(imagefile);

    return url;
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
    return isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            body: Center(
              child: SafeArea(
                child: Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.04),
                          child: Image(
                            image: AssetImage('images/appiconnoback.png'),
                            height: MediaQuery.of(context).size.height * 0.08,
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.028),
                      Flexible(
                          child: Text(
                        'Select an Avatar',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'young',
                            fontSize:
                                MediaQuery.of(context).size.height * 0.035),
                      )),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.028),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.27,
                          width: MediaQuery.of(context).size.height * 0.27,
                          child: myCircleAvatar(avatarimage: avatarshowimage)),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.028),
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
                                    Image(
                                        image:
                                            AssetImage('images/avatar0.jpg')),
                                    false);
                                _avatarbuttons[1] = myAvatarSelection(
                                    Image(
                                        image:
                                            AssetImage('images/avatar1.jpg')),
                                    false);
                                _avatarbuttons[2] = myAvatarSelection(
                                    Image(
                                        image:
                                            AssetImage('images/avatar2.jpg')),
                                    false);
                                _avatarbuttons[3] = myAvatarSelection(
                                    Image(
                                        image:
                                            AssetImage('images/avatar3.jpg')),
                                    false);
                                _avatarbuttons[4] = myAvatarSelection(
                                    Image(
                                        image:
                                            AssetImage('images/avatar4.jpg')),
                                    false);
                                _avatarbuttons[5] = myAvatarSelection(
                                    Image(
                                        image:
                                            AssetImage('images/avatar5.jpg')),
                                    false);
                                _avatarbuttons[6] = myAvatarSelection(
                                    Image(
                                        image:
                                            AssetImage('images/avatar6.jpg')),
                                    false);
                                _avatarbuttons[7] = myAvatarSelection(
                                    Image(
                                        image:
                                            AssetImage('images/avatar7.jpg')),
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
                                    image:
                                        AssetImage('images/avatar$index.jpg'),
                                  );
                                } else {
                                  pick();
                                }
                                _avatarbuttons[index] = myAvatarSelection(
                                    Image(
                                        image: AssetImage(
                                            'images/avatar$index.jpg')),
                                    true);
                              });
                            },
                            renderBorder: false,
                            fillColor: Colors.transparent,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.042,
                      ),
                      Flexible(
                          child: Row(
                        children: [
                          Flexible(
                              child: Container(
                            child: myOutlineButton(
                                colorschemeclass.lightgrey, 'Skip', () {
                              urltobeset = urls.avatar1url;
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Registerbioscreen(
                                    name, codername, urltobeset);
                              }));
                            }),
                          )),
                          Flexible(
                              child: Container(
                            child: myButton(
                                colorschemeclass.primarygreen, 'Add Avatar',
                                () async {
                              if (imagetobeuploaded != null) {
                                setState(() {
                                  isLoading = true;
                                });
                                urltobeset =
                                    await generateUrl(imagetobeuploaded);
                                setState(() {
                                  isLoading = false;
                                });
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Registerbioscreen(
                                      name, codername, urltobeset);
                                }));
                              } else {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Registerbioscreen(
                                      name, codername, urltobeset);
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

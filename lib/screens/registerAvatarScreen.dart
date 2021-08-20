import 'dart:async';
import 'dart:io';
import 'package:coderstatus/components/colorscheme.dart';
import 'package:coderstatus/components/urls.dart';
import 'package:coderstatus/firebase_layer/uploadAvatar.dart';
import 'package:coderstatus/screens/registerBioScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../components/generalLoader.dart';
import '../components/myAvatarSelection.dart';
import '../components/myButtons.dart';
import '../functions/pickImageAndCrop.dart' as pickImageAndCrop;
import '../components/myCircleAvatar.dart';
import '../components/noInternet.dart';

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
  Image avatarshowimage = Image(image: NetworkImage(Urls.avatar1url));
  File imagetobeuploaded;
  String urltobeset = Urls.avatar1url;
  bool isLoading = false;
  StreamSubscription subscription;

  @override
  Future<void> initState() {
    super.initState();

    subscription = InternetConnectionChecker().onStatusChange.listen((status) {
      final hasInternet = status == InternetConnectionStatus.connected;

      if (!hasInternet) NoInternet(this.context);
    });

    if (FirebaseAuth.instance.currentUser.photoURL != null) {
      urltobeset = FirebaseAuth.instance.currentUser.photoURL;
      avatarshowimage = Image(image: NetworkImage(urltobeset));
    }
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

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
    MyAvatarSelection(Image(image: AssetImage('images/avatar0.jpg')), false),
    MyAvatarSelection(Image(image: AssetImage('images/avatar1.jpg')), true),
    MyAvatarSelection(Image(image: AssetImage('images/avatar2.jpg')), false),
    MyAvatarSelection(Image(image: AssetImage('images/avatar3.jpg')), false),
    MyAvatarSelection(Image(image: AssetImage('images/avatar4.jpg')), false),
    MyAvatarSelection(Image(image: AssetImage('images/avatar5.jpg')), false),
    MyAvatarSelection(Image(image: AssetImage('images/avatar6.jpg')), false),
    MyAvatarSelection(Image(image: AssetImage('images/avatar7.jpg')), false),
  ];

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: GeneralLoader(''),
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
                          child: MyCircleAvatar(avatarshowimage)),
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
                                _avatarbuttons[0] = MyAvatarSelection(
                                    Image(
                                        image:
                                            AssetImage('images/avatar0.jpg')),
                                    false);
                                _avatarbuttons[1] = MyAvatarSelection(
                                    Image(
                                        image:
                                            AssetImage('images/avatar1.jpg')),
                                    false);
                                _avatarbuttons[2] = MyAvatarSelection(
                                    Image(
                                        image:
                                            AssetImage('images/avatar2.jpg')),
                                    false);
                                _avatarbuttons[3] = MyAvatarSelection(
                                    Image(
                                        image:
                                            AssetImage('images/avatar3.jpg')),
                                    false);
                                _avatarbuttons[4] = MyAvatarSelection(
                                    Image(
                                        image:
                                            AssetImage('images/avatar4.jpg')),
                                    false);
                                _avatarbuttons[5] = MyAvatarSelection(
                                    Image(
                                        image:
                                            AssetImage('images/avatar5.jpg')),
                                    false);
                                _avatarbuttons[6] = MyAvatarSelection(
                                    Image(
                                        image:
                                            AssetImage('images/avatar6.jpg')),
                                    false);
                                _avatarbuttons[7] = MyAvatarSelection(
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
                                        urltobeset = Urls.avatar1url;
                                      }
                                      break;
                                    case 2:
                                      {
                                        urltobeset = Urls.avatar2url;
                                      }
                                      break;
                                    case 3:
                                      {
                                        urltobeset = Urls.avatar3url;
                                      }
                                      break;
                                    case 4:
                                      {
                                        urltobeset = Urls.avatar4url;
                                      }
                                      break;
                                    case 5:
                                      {
                                        urltobeset = Urls.avatar5url;
                                      }
                                      break;
                                    case 6:
                                      {
                                        urltobeset = Urls.avatar6url;
                                      }
                                      break;
                                    case 7:
                                      {
                                        urltobeset = Urls.avatar7url;
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
                                _avatarbuttons[index] = MyAvatarSelection(
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
                            child: MyOutlineButton(
                                ColorSchemeClass.lightgrey, 'Skip', () {
                              urltobeset = FirebaseAuth
                                          .instance.currentUser.photoURL ==
                                      null
                                  ? Urls.avatar1url
                                  : FirebaseAuth.instance.currentUser.photoURL;
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Registerbioscreen(
                                    name, codername, urltobeset);
                              }));
                            }),
                          )),
                          Flexible(
                              child: Container(
                            child: MyButton(
                                ColorSchemeClass.primarygreen, 'Add Avatar',
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

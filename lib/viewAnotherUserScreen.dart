import 'package:codersstatus/components/atcoderDialog.dart';
import 'package:codersstatus/components/codechefDialog.dart';
import 'package:codersstatus/components/codeforcesDialog.dart';
import 'package:codersstatus/components/myAppBarWithBack.dart';
import 'package:codersstatus/components/myButton.dart';
import 'package:codersstatus/components/myDividerWithTitle.dart';
import 'package:codersstatus/components/myOtherCircleAvatar.dart';
import 'package:codersstatus/components/myOutlineButton.dart';
import 'package:codersstatus/components/spojDialog.dart';
import 'package:codersstatus/components/urls.dart';
import 'package:codersstatus/editProfileScreen.dart';
import 'package:codersstatus/firebase_layer/getUserInfo.dart';
import 'package:codersstatus/firebase_layer/setUserInfo.dart';
import 'package:codersstatus/functions/getRating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:codersstatus/components/colorscheme.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:codersstatus/components/myRatingCard.dart';
import 'package:rect_getter/rect_getter.dart';

class ViewAnotherUserScreen extends StatefulWidget {
  String uid = '';
  ViewAnotherUserScreen(String uid) {
    this.uid = uid;
  }

  @override
  _ViewAnotherUserScreenState createState() => _ViewAnotherUserScreenState(uid);
}

class _ViewAnotherUserScreenState extends State<ViewAnotherUserScreen> {
  String uid = '';
  var globalKey1 = RectGetter.createGlobalKey();
  var globalKey2 = RectGetter.createGlobalKey();
  var globalKey3 = RectGetter.createGlobalKey();
  var globalKey4 = RectGetter.createGlobalKey();
  String name = 'name',
      codername = 'codername',
      avatarurl = Urls.avatar1url,
      bio = 'Hey there, I love Competitive Programming',
      myUid = '';
  List<String> userhandles = ['', '', '', ''],
      userrating = ['0', '0', '0', '0'];
  _ViewAnotherUserScreenState(String uid) {
    this.uid = uid;
  }

  Future futureFunction;
  bool isFirstTime = true;
  bool isPeered = false;
  bool isMe = false;
  bool isLoading = false;
  List<Widget> listOfRatingCards = [];

  addInPeers() async {
    setState(() {
      isLoading = true;
    });
    var peers = await GetUserInfo.getUserPeers();
    peers.add(uid);
    await SetUserInfo.updatePeers(peers);
    setState(() {
      isLoading = false;
      isPeered = true;
    });
  }

  removeFromPeers() async {
    setState(() {
      isLoading = true;
    });
    var peers = await GetUserInfo.getUserPeers();
    int k = peers.indexOf(uid);
    var newPeers = [];
    for (int i = 0; i < peers.length; i++) {
      if (i != k) newPeers.add(peers[i]);
    }
    await SetUserInfo.updatePeers(newPeers);
    setState(() {
      isLoading = false;
      isPeered = false;
    });
  }

  readyUserData() async {
    myUid = GetUserInfo.getUserUid();
    final userDocument = await GetUserInfo.getUserDocument(uid);
    print('reached -1');
    avatarurl = userDocument['avatarurl'];
    name = userDocument['name'];
    codername = userDocument['codername'];
    bio = userDocument['bio'];
    userhandles[0] = userDocument['codeforces'];
    userhandles[1] = userDocument['codechef'];
    userhandles[2] = userDocument['atcoder'];
    userhandles[3] = userDocument['spoj'];

    if (userhandles[0] != '') {
      userrating[0] = await GetRating.getCodeforcesRating(userhandles[0]);
      if (userrating[0] != '0')
        listOfRatingCards.add(RectGetter(
          key: globalKey1,
          child: GestureDetector(
            onTap: () {
              var rect = RectGetter.getRectFromKey(globalKey1);
              print(rect.toString());
              showCodeforcesDialog(
                  this.context, rect, userhandles[0], userrating[0]);
            },
            child: MyRatingCard(AssetImage('images/codeforcestile.png'),
                ColorSchemeClass.codeforcespurple, userrating[0] + ' pts'),
          ),
        ));
    }

    if (userhandles[1] != '') {
      userrating[1] = await GetRating.getCodechefRating(userhandles[1]);
      if (userrating[1] != '0')
        listOfRatingCards.add(RectGetter(
          key: globalKey2,
          child: GestureDetector(
            onTap: () {
              var rect = RectGetter.getRectFromKey(globalKey2);
              print(rect.toString());
              showCodechefDialog(
                  this.context, rect, userhandles[1], userrating[1]);
            },
            child: MyRatingCard(AssetImage('images/codecheftile.png'),
                ColorSchemeClass.codechefbrown, userrating[1] + ' pts'),
          ),
        ));
    }

    if (userhandles[2] != '') {
      userrating[2] = await GetRating.getAtcoderRating(userhandles[2]);
      if (userrating[2] != '0')
        listOfRatingCards.add(RectGetter(
          key: globalKey3,
          child: GestureDetector(
            onTap: () {
              var rect = RectGetter.getRectFromKey(globalKey3);
              print(rect.toString());
              showAtcoderDialog(
                  this.context, rect, userhandles[2], userrating[2]);
            },
            child: MyRatingCard(AssetImage('images/atcodertile.png'),
                ColorSchemeClass.atcodergrey, userrating[2] + ' pts'),
          ),
        ));
    }

    if (userhandles[3] != '') {
      userrating[3] = await GetRating.getSpojRating(userhandles[3]);
      if (userrating[3] != '0')
        listOfRatingCards.add(RectGetter(
          key: globalKey4,
          child: GestureDetector(
            onTap: () {
              var rect = RectGetter.getRectFromKey(globalKey4);
              print(rect.toString());
              showSpojDialog(this.context, rect, userhandles[3], userrating[3]);
            },
            child: MyRatingCard(AssetImage('images/spojtile.png'),
                ColorSchemeClass.spojblue, userrating[3] + ' pts'),
          ),
        ));
    }

    if (myUid == uid) {
      isMe = true;
    } else {
      var peers = await GetUserInfo.getUserPeers();
      if (peers.contains(uid)) {
        isPeered = true;
      } else {
        isPeered = false;
      }
    }
    setState(() {
      isFirstTime = false;
    });
  }

  @override
  void initState() {
    super.initState();
    futureFunction = readyUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: MyAppBarWithBack('User'),
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
      ),
      body: isFirstTime
          ? FutureBuilder(
              future: futureFunction,
              builder: (context, snapshot) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          : SafeArea(
              child: Container(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                child: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.14,
                                width:
                                    MediaQuery.of(context).size.height * 0.14,
                                child: MyOtherCircleAvatar(
                                    Image(
                                      image: NetworkImage(avatarurl),
                                    ),
                                    ColorSchemeClass.lightgrey)),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'young',
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.007,
                                ),
                                Text(
                                  '@' + codername,
                                  style: TextStyle(
                                      color: ColorSchemeClass.lightgrey,
                                      fontFamily: 'young',
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        isMe
                            ? MyOutlineButton(
                                ColorSchemeClass.lightgrey, 'Edit Profile', () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return EditProfileScreen();
                                }));
                              })
                            : isLoading
                                ? Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.078,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : isPeered
                                    ? MyOutlineButton(
                                        ColorSchemeClass.lightgrey,
                                        'Remove from Peers', () {
                                        removeFromPeers();
                                      }, Icons.remove_circle_outline)
                                    : MyButton(ColorSchemeClass.primarygreen,
                                        'Add as a Peer', () {
                                        addInPeers();
                                      }, Icons.add_circle),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        MyMidDividerWithTitle('Bio'),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Text(
                          bio,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: ColorSchemeClass.lightgrey,
                              fontFamily: 'young',
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        MyMidDividerWithTitle('Ratings'),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        listOfRatingCards.length == 0
                            ? Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.32,
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Center(
                                  child: Text(
                                    'The user hasn\'t added any User Handles or doesn\'t have rating on a platform',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: ColorSchemeClass.darkgrey,
                                        fontFamily: 'young',
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                  ),
                                ),
                              )
                            : (listOfRatingCards.length % 2 == 1)
                                ? listOfRatingCards.length == 3
                                    ? Column(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.155,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                            child: Theme(
                                              data: ThemeData(
                                                  accentColor:
                                                      Colors.transparent),
                                              child: GridView.count(
                                                  crossAxisCount: 2,
                                                  children: listOfRatingCards
                                                      .sublist(0, 2)),
                                            ),
                                          ),
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.155,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                            child: Center(
                                              child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.155,
                                                  child: listOfRatingCards[2]),
                                            ),
                                          )
                                        ],
                                      )
                                    : Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.155,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        child: Center(
                                          child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.155,
                                              child: listOfRatingCards[0]),
                                        ),
                                      )
                                : Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.32,
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Theme(
                                      data: ThemeData(
                                          accentColor: Colors.transparent),
                                      child: GridView.count(
                                          crossAxisCount: 2,
                                          children: listOfRatingCards),
                                    ),
                                  )
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

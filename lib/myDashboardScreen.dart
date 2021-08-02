import 'package:codersstatus/components/atcoderDialog.dart';
import 'package:codersstatus/components/codechefDialog.dart';
import 'package:codersstatus/components/codeforcesDialog.dart';
import 'package:codersstatus/components/showAnimatedToast.dart';
import 'package:codersstatus/components/myFadeInCircleAvatar.dart';
import 'package:codersstatus/components/spojDialog.dart';
import 'package:codersstatus/components/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:codersstatus/components/colorscheme.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:codersstatus/components/myTile.dart';
import 'package:rect_getter/rect_getter.dart';

class MyDashboardScreen extends StatefulWidget {
  String name = 'name',
      codername = 'codername',
      avatarurl = urls.avatar1url,
      bio = 'Hey there, I love Competitive Programming';
  List<String> userhandles, userrating;
  MyDashboardScreen(String name, String codername, String avatarurl, String bio,
      List<String> userhandles, List<String> userrating) {
    this.name = name;
    this.codername = codername;
    this.avatarurl = avatarurl;
    this.bio = bio;
    this.userhandles = userhandles;
    this.userrating = userrating;
  }

  @override
  _MyDashboardScreenState createState() => _MyDashboardScreenState(
      name, codername, avatarurl, bio, userhandles, userrating);
}

class _MyDashboardScreenState extends State<MyDashboardScreen> {
  var globalKey1 = RectGetter.createGlobalKey();
  var globalKey2 = RectGetter.createGlobalKey();
  var globalKey3 = RectGetter.createGlobalKey();
  var globalKey4 = RectGetter.createGlobalKey();
  String name = 'name',
      codername = 'codername',
      avatarurl = urls.avatar1url,
      bio = 'Hey there, I love Competitive Programming';
  List<String> userhandles, userrating;
  _MyDashboardScreenState(String name, String codername, String avatarurl,
      String bio, List<String> userhandles, List<String> userrating) {
    this.name = name;
    this.codername = codername;
    this.avatarurl = avatarurl;
    this.bio = bio;
    this.userhandles = userhandles;
    this.userrating = userrating;
  }

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.015),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Center(
                    child: Image(image: AssetImage('images/appiconnoback.png')),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.height * 0.25,
                        child: myFadeInCircleAvatar(avatarurl)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'young',
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.035),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.007,
                    ),
                    Text(
                      '@' + codername,
                      style: TextStyle(
                          color: colorschemeclass.lightgrey,
                          fontFamily: 'young',
                          fontSize: MediaQuery.of(context).size.height * 0.025),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      bio,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: colorschemeclass.lightgrey,
                          fontFamily: 'young',
                          fontSize: MediaQuery.of(context).size.height * 0.025),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Wrap(
                      children: [
                        userrating[0] != '0'
                            ? RectGetter(
                                key: globalKey1,
                                child: GestureDetector(
                                  onTap: () {
                                    var rect =
                                        RectGetter.getRectFromKey(globalKey1);
                                    print(rect.toString());
                                    showCodeforcesDialog(this.context, rect,
                                        userhandles[0], userrating[0]);
                                  },
                                  child: myTile(
                                      AssetImage('images/codeforcestile.png'),
                                      colorschemeclass.codeforcespurple,
                                      userrating[0] + ' pts'),
                                ),
                              )
                            : SizedBox(),
                        userrating[1] != '0'
                            ? RectGetter(
                                key: globalKey2,
                                child: GestureDetector(
                                  onTap: () {
                                    var rect =
                                        RectGetter.getRectFromKey(globalKey2);
                                    print(rect.toString());
                                    showCodechefDialog(this.context, rect,
                                        userhandles[1], userrating[1]);
                                  },
                                  child: myTile(
                                      AssetImage('images/codecheftile.png'),
                                      colorschemeclass.codechefbrown,
                                      userrating[1] + ' pts'),
                                ),
                              )
                            : SizedBox(),
                        userrating[2] != '0'
                            ? RectGetter(
                                key: globalKey3,
                                child: GestureDetector(
                                  onTap: () {
                                    var rect =
                                        RectGetter.getRectFromKey(globalKey3);
                                    print(rect.toString());
                                    showAtcoderDialog(this.context, rect,
                                        userhandles[2], userrating[2]);
                                  },
                                  child: myTile(
                                      AssetImage('images/atcodertile.png'),
                                      colorschemeclass.atcodergrey,
                                      userrating[2] + ' pts'),
                                ),
                              )
                            : SizedBox(),
                        userrating[3] != '0'
                            ? RectGetter(
                                key: globalKey4,
                                child: GestureDetector(
                                  onTap: () {
                                    var rect =
                                        RectGetter.getRectFromKey(globalKey4);
                                    print(rect.toString());
                                    showSpojDialog(this.context, rect,
                                        userhandles[3], userrating[3]);
                                  },
                                  child: myTile(
                                      AssetImage('images/spojtile.png'),
                                      colorschemeclass.spojblue,
                                      userrating[3] + ' pts'),
                                ),
                              )
                            : SizedBox(),
                        /*myTile(AssetImage('images/githubtile.png'),
                                    Colors.white, '26 reps')*/
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

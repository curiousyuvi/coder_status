import 'package:codersstatus/components/loadingScreen.dart';
import 'package:codersstatus/components/myButton.dart';
import 'package:codersstatus/components/myCircleAvatar.dart';
import 'package:codersstatus/components/myFadeInCircleAvatar.dart';
import 'package:codersstatus/components/urls.dart';
import 'package:codersstatus/firebase_layer/getUserInfo.dart';
import 'package:codersstatus/firebase_layer/logoutuser.dart';
import 'package:codersstatus/functions/getRating.dart';
import 'package:codersstatus/registerbadgesscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:codersstatus/components/colorscheme.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:codersstatus/components/myTile.dart';

class mydashboardscreen extends StatefulWidget {
  String name = 'name', codername = 'codername', avatarurl = urls.avatar1url;
  List<String> userhandles, userrating;
  mydashboardscreen(String name, String codername, String avatarurl,
      List<String> userhandles, List<String> userrating) {
    this.name = name;
    this.codername = codername;
    this.avatarurl = avatarurl;
    this.userhandles = userhandles;
    this.userrating = userrating;
  }

  @override
  _mydashboardscreenState createState() => _mydashboardscreenState(
      name, codername, avatarurl, userhandles, userrating);
}

class _mydashboardscreenState extends State<mydashboardscreen> {
  String name = 'name', codername = 'codername', avatarurl = urls.avatar1url;
  List<String> userhandles, userrating;
  _mydashboardscreenState(String name, String codername, String avatarurl,
      List<String> userhandles, List<String> userrating) {
    this.name = name;
    this.codername = codername;
    this.avatarurl = avatarurl;
    this.userhandles = userhandles;
    this.userrating = userrating;
  }

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(4),
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
                  Wrap(
                    children: [
                      userrating[0] != '0'
                          ? myTile(
                              AssetImage('images/codeforcestile.png'),
                              colorschemeclass.codeforcespurple,
                              userrating[0] + ' pts')
                          : SizedBox(),
                      userrating[1] != '0'
                          ? myTile(
                              AssetImage('images/codecheftile.png'),
                              colorschemeclass.codechefbrown,
                              userrating[1] + ' pts')
                          : SizedBox(),
                      userrating[2] != '0'
                          ? myTile(
                              AssetImage('images/atcodertile.png'),
                              colorschemeclass.atcodergrey,
                              userrating[2] + ' pts')
                          : SizedBox(),
                      userrating[3] != '0'
                          ? myTile(AssetImage('images/spojtile.png'),
                              colorschemeclass.spojblue, userrating[3] + ' pts')
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
    );
  }
}

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

void main() => runApp(MaterialApp(
      home: homescreen(),
    ));

class homescreen extends StatefulWidget {
  const homescreen({Key key}) : super(key: key);

  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  String name = 'name', codername = 'codername', avatarurl = urls.avatar1url;
  List<String> userhandles, userrating;
  bool isloading = false;

  readyUserData() async {
    name = await GetUserInfo.getUserName();
    codername = await GetUserInfo.getUserCoderName();
    avatarurl = await GetUserInfo.getUserAvatarUrl();
    userhandles = await GetUserInfo.getUserHandles();
    userrating = [null, null, null, null];

    userrating[0] = await GetRating.getCodeforcesRating(userhandles[0]);
    userrating[1] = await GetRating.getCodechefRating(userhandles[1]);
    userrating[2] = await GetRating.getAtcoderRating(userhandles[2]);
    userrating[3] = await GetRating.getSpojRating(userhandles[3]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: readyUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
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
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return registerbadgesscreen();
                                }));
                              },
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.299,
                            ),
                            Image(
                                image: AssetImage('images/appiconnoback.png')),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.299,
                            ),
                            GestureDetector(
                              onTap: () {
                                logout(context);
                              },
                              child: Icon(
                                Icons.settings,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
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
                            fontSize:
                                MediaQuery.of(context).size.height * 0.035),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.007,
                      ),
                      Text(
                        '@' + codername,
                        style: TextStyle(
                            color: colorschemeclass.lightgrey,
                            fontFamily: 'young',
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025),
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
                                  colorschemeclass.codeforcespurple,
                                  userrating[1] + ' pts')
                              : SizedBox(),
                          userrating[2] != '0'
                              ? myTile(
                                  AssetImage('images/atcodertile.png'),
                                  colorschemeclass.codeforcespurple,
                                  userrating[2] + ' pts')
                              : SizedBox(),
                          userrating[3] != '0'
                              ? myTile(
                                  AssetImage('images/spojtile.png'),
                                  colorschemeclass.codeforcespurple,
                                  userrating[3] + ' pts')
                              : SizedBox(),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
